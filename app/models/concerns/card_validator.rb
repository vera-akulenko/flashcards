# frozen_string_literal: true

# validate original_text with translated_text
class CardValidator < ActiveModel::Validator
  def validate(record)
    return unless record.original_text.strip.casecmp(
      record.translated_text.strip
    ).zero?

    record.errors.add(:translated_text, 'must not such as Original text')
  end
end
