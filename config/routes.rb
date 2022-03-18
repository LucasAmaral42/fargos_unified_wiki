# frozen_string_literal: true

Rails.application.routes.draw do
  root 'items#show'
  get :types, to: 'items#types'
end
