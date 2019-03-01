# frozen_string_literal: true

Rails.application.routes.draw do
  root 'base#show'

  resources :cards, only: %i[index show edit update destroy create new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
