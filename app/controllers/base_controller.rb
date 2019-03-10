# frozen_string_literal: true

# BaseController
class BaseController < ApplicationController
  def show
    return unless params.dig(:card, :original_text)
    return unless params.dig(:card, :translated_text)

    @result = translation_is_correct?(
      card_params[:original_text],
      card_params[:translated_text]
    )

    @card.update(review_date: Time.now + 3.day) if @result
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def translation_is_correct?(original_text, translated_text)
    @card = Card.find_by(translated_text: translated_text)

    return false unless @card

    /#{@card.original_text}/i.match?(original_text) ? true : false
  end
end
