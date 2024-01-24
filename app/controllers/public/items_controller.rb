class Public::ItemsController < ApplicationController
  def index
    # @items = Item.all
    @items = Item.page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def list_params
    params.require(:item).permit()
  end

end
