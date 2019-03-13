# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  def show
    @random_card = Card.random

    return unless params.dig(:card, :original_text)
    return unless params.dig(:card, :id)

    update_review_date(card_params)
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :id)
  end

  def translation_is_correct?(original_text, id)
    @card = Card.find(id)

    return false unless @card

    /#{@card.original_text}/i.match?(original_text)
  end

  def update_review_date(card_params)
    flash[:notice] =
      if translation_is_correct?(card_params[:original_text], card_params[:id])
        @card.update(review_date: Time.now + 3.day)
        'Правильно'
      else
        'Не правильно'
      end
  end
end
