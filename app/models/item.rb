# frozen_string_literal: true

class Item
  include Mongoid::Document
  field :name, type: String
  field :types, type: Array
  field :description, type: String
  field :mod, type: String
  field :url, type: String
  field :image_url, type: String
end
