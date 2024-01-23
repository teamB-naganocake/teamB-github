class Public::ItemsController < ApplicationController
  def index
    #@items = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  def list_params
    params.require(:item).permit()
  end


end
