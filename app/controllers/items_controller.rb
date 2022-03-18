class ItemsController < ApplicationController
  def show
    render json: Item.in(filters).to_json
  end

  def types
    render json: Item.all.pluck(:types).flatten.uniq
  end

  private

  def item_params
    params.permit(types: [], mod: [])
  end

  def filters
    params.except('controller', 'action').reject{|_, v| v.blank?}
  end
end
