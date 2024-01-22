class Admin::OrdersDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order = Order.find(params[:id])
    order_detail = OrderDetail.find(params[:id])
    order_details = order.order_details
    order_detail.update(making_stats_params)

    if order_details.all? { |order_detail| order_detail.production_completed? }
      order.update(stats: 3)
    end

    if order_details.in_process
      order.update(stats: 2)
    end

    redirect_to admin_order_path(order_detail)
  end

  private

  def making_stats_params
    params.require(:order_detail).permit(:making_stats)
  end
end
