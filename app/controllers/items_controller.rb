class ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    @items = Item.in(
      types: item_params[:types],
      mod: item_params[:mod]
    )

    render json: @items.to_json
  end

  private

  def item_params
    params.require(:item).permit(types: [], mod: [])
  end
end
