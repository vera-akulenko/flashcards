# frozen_string_literal: true

# Get all cards
class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
end
