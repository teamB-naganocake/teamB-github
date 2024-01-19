class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    #ジャンル？（柳）
  end

  def show
    @item = Item.find(params[:id])
    #カート？（柳）
  end
end
