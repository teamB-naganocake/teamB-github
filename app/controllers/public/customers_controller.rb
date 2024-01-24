class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    # customer = Customer.find(params[:id])
    customer = Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to public_customers_mypage_path, notice: "変更内容を保存しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    redirect_to public_top_path, notice: "退会処理を実行いたしました。"
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
