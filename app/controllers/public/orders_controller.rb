class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    order = Order.new(order_params)
    if order.save
      # カート内商品は消すために、情報を注文詳細に移す。
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to public_thanks_orders_path
    else
      @orders = current_customer.orders
      flash.now[:alert] = "注文できませんでした。"
      render :index
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    # @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items = current_customer.cart_items
    @sum = 0
    @order.shipping_cost = 800

    if params[:order][:select_address] == "0" # 自身の住所
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1" # 登録済み住所
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address] == "2" # 新しいお届け先
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      
    else
      render :new
    end
    @cart_items = current_customer.cart_items
    render :confirm
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    # @order_details = OrderDetail.where(order_id: @order.id)
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:address, :name, :shipping_cost, :total_payment, :payment_method, :stats)
  end
end
