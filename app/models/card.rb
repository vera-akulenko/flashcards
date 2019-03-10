# frozen_string_literal: true

# model Card
class Card < ApplicationRecord
  scope :with_old_review_date, -> { where('review_date <= ?', 3.day.ago) }

  validates :original_text, presence: true, uniqueness: true
  validates :translated_text, presence: true

  validate :original_and_translated_texts_are_not_same

  before_create do
    self.review_date = Time.now + 3.day
  end

  def self.random
    return if count.zero?

    with_old_review_date.order('RANDOM()').take
  end

  def original_and_translated_texts_are_not_same
    return unless original_text.strip.casecmp(
      translated_text.strip
    ).zero?

    errors.add(:translated_text, 'must not such as Original text')
  end
end
