# frozen_string_literal: true

# model Card
class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  validates_date :review_date, on: :update

  validates_with CardValidator

  before_create do
    self.review_date = Time.now + 3.day
  end
end
