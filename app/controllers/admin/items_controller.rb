class Admin::ItemsController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の新規登録が完了しました"
      redirect_to admin_items_path(@item.id)
    else
      flash[:notice] = "商品の新規登録に失敗しました"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品詳細の変更が完了しました。"
      redirect_to admin_item_path
    else
      flash[:notice] = "商品詳細の変更に失敗しました。"
      render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price,:is_active)
  end
  #販売ステータス追加・genre?genre.name? (柳)
end
