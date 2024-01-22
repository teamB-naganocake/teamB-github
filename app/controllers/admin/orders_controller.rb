class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    order.update(stats_params)

    if order.awaiting_payment?
      order_details.update_all(making_stats: 0)
    elsif order.payment_confirmation?
      order_details.update_all(making_stats: 1)
    end

    redirect_to admin_order_path(order)
  end

  private

  def stats_params
    params.require(:order).permit(:stats)
  end
end
