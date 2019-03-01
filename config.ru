# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

if Card.count < 4
  Card.create(
    original_text: :original_text1,
    translated_text: :translated_text1,
    review_date: Time.now
  )
  Card.create(
    original_text: :original_text2,
    translated_text: :translated_text2,
    review_date: Time.now - 1.day
  )
  Card.create(
    original_text: :original_text3,
    translated_text: :translated_text3,
    review_date: Time.now
  )
end

run Rails.application
