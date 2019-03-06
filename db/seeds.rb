# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

require 'nokogiri'

# Fetch and parse HTML
html = Nokogiri::HTML(open('http://1000mostcommonwords.com/1000-most-common-german-words/'))

html.xpath('//tbody')[0].children[2..1000].each do |child|
  next if child.children.empty?

  de = child.children[3].children[0].content
  en = child.children[5].children[0].content

  Card.create(
    original_text: de,
    translated_text: en
  )
end
