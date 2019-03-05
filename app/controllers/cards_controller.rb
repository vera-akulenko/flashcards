# frozen_string_literal: true

# Get all cards
class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = 'Card was added'
      redirect_to card_url(@card)
    else
      flash[:errors] = 'Card did not save, try again'
      render 'new'
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    card = Card.find(params[:id])
    card.update!(card_params)
    redirect_to card
  end

  def show
    @card = Card.find(params[:id])
  end

  def destroy
    Card.find(params[:id]).destroy
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
