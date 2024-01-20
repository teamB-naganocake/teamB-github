class Admin::HomesController < ApplicationController
  def top
    # @orders = Order.page(params[:page]).per(10)
    @orders = Order.all
  end
end
