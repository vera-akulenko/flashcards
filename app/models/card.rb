# frozen_string_literal: true

# model Card
class Card < ApplicationRecord
  validates :original_text, presence: true, uniqueness: true
  validates :translated_text, presence: true

  validate :original_and_translated_texts_are_not_same

  before_create do
    self.review_date = Time.now + 3.day
  end

  def original_and_translated_texts_are_not_same
    return unless original_text.strip.casecmp(
      translated_text.strip
    ).zero?

    errors.add(:translated_text, 'must not such as Original text')
  end
end
