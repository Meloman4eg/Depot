require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new( title: 'Some book title',
                           description: 'Some description',
                           image_url: 'dpv.jpg')

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: 'My big title, boss!',
                description: 'dpv',
                price: 1,
                image_url: image_url)
  end

  test 'image url' do
    good = %w{ pavel.gif pavel.jpg pavel.png PAVEL.GIF PAVEL.JPG PaveL.Jpg
             http://a.b.c/x/y/z/pavel.png }
    bad = %w{ pavel.doc pavel.gif/more pavel.gif/more }

    good.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test 'product is not valid without unique title' do
    product = Product.new(title: products(:ruby).title,
                          description: 'dpv',
                          price: 1,
                          image_url: 'pavel.jpg')
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test 'product is not valid without unique title - i18n' do
    product = Product.new(title: products(:ruby).title,
                          description: 'dpv',
                          price: 1,
                          image_url: 'pavel.jpg')
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test "product title length must be al least 10 symbols" do
    product = Product.new( title: '',
                           description: 'Some description',
                           image_url: 'dpv.jpg',
                           price: 1)

    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]

    product.title = '123456789'
    assert product.invalid?
    assert_equal ["is too short (minimum is 10 characters)"], product.errors[:title]

    product.title = '1234567890'
    assert product.valid?

    product.title = 'this is big title of the product'
    assert product.valid?
  end

end
