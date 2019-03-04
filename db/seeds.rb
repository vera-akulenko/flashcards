# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

return if Card.count > 4

Card.create(
  original_text: :original_text1,
  translated_text: :translated_text1
)
Card.create(
  original_text: :original_text2,
  translated_text: :translated_text2
)
Card.create(
  original_text: :original_text3,
  translated_text: :translated_text3
)
