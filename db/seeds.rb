# frozen_string_literal: true

# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

require 'nokogiri'

Card.all.map(&:destroy)

c = Card.create(
  original_text: 'sonne',
  translated_text: 'sun',
  review_date: Time.now - 4.day
)
c.update(review_date: Time.now - 4.day)

c2 = Card.create(
  original_text: 'gott',
  translated_text: 'god',
  review_date: Time.now - 4.day
)
c2.update(review_date: Time.now - 5.day)

# Fetch and parse HTML
html = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-german-words/'))

html.xpath('//tbody')[0].children[2..50].each do |child|
  next if child.children.empty?

  de = child.children[3].children[0].content
  en = child.children[5].children[0].content

  Card.create(
    original_text: de,
    translated_text: en
  )
end
