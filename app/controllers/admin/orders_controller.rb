class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(order_params)
      if @order.payment_confirmation?
        @order_details.update_all(making_status: 1)
      elsif @order_details.in_process?
        @order.update(status: 2)
      elsif 
        
      end
      redirect_to admin_order_path(order)
    else
      render admin_order_path(order)
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
