class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @sum = 0
  end

  # カート商品を追加・保存
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
    #ex.バナナ２個、バナナ２個ではなくバナナ「4個」にしたい
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      #元々カート内にあるもの「item_id」
      #今追加したparams[:cart_item][:item_id])
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      #cart_item.quantityに今追加したparams[:cart_item][:amount]を加える
      #.to_iとして数字として扱う
      cart_item.save
      redirect_to public_cart_items_path

    elsif @cart_item.save# もしカート内に「同じ」商品がない場合は通常の保存処理
      @cart_items = current_customer.cart_items.all
      redirect_to public_cart_items_path

    else# 保存できなかった場合
      render :index
    end
  end

  def update
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.update(cart_item_params)
    @cart_items = current_customer.cart_items.all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_items = current_customer.cart_items.all
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items.all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount,)
  end
end
