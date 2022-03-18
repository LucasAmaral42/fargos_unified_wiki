class ItemsController < ApplicationController
  def show
    render json: Item.in(filters).to_json
  end

  private

  def item_params
    params.permit(types: [], mod: [])
  end

  def filters
    params.except('controller', 'action').reject{|_, v| v.blank?}
  end
end
