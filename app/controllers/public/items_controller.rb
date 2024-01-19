class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    #ジャンル？（柳）
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    #カート？（柳）
  end
  
  
  def list_params
    params.require(:item).permit(:title, :body)
  end
  
  
end
