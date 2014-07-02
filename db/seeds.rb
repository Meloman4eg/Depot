# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# encoding: utf-8
Product.delete_all
Product.create!(title: 'CoffeeScript',
                description:
                    %{<p>
       CoffeeScript ([’kɔ:fɪ skrɪpt]; кофи скрипт) — язык программирования,
транслируемый в JavaScript. CoffeeScript добавляет синтаксический сахар в духе Ruby,
Python, Haskell и Erlang для того, чтобы улучшить читаемость кода и уменьшить его размер.
CoffeeScript позволяет писать более компактный код по сравнению с JavaScript[3].
JavaScript-код, получаемый трансляцией из CoffeeScript, полностью проходит проверку JavaScript Lint.
      </p>},
                image_url:   'cs.jpg',
                price: 36.00)
# . . .
Product.create!(title: 'Программирование на Ruby 1.9 & 2.0',
                description:
                    %{<p>
        Ruby (англ. ruby — рубин, произносится ['ru:bɪ]) — динамический, рефлективный, интерпретируемый
 высокоуровневый язык программирования для быстрого и удобного[7][8] объектно-ориентированного программирования.
Язык обладает независимой от операционной системы реализацией многопоточности, строгой динамической типизацией,
сборщиком мусора и многими другими возможностями. Ruby близок по особенностям синтаксиса к языкам Perl и Eiffel,
по объектно-ориентированному подходу — к Smalltalk. Также некоторые черты языка взяты из Python, Lisp, Dylan и Клу.
                    </p>},
                image_url: 'ruby.jpg',
                price: 49.95)
# . . .

Product.create!(title: 'Rails Test Prescriptions',
                description:
                    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
                image_url: 'rtp.jpg',
                price: 34.95)