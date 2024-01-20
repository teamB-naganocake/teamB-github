class Public::AddressesController < ApplicationController
  #before_action :authenticate_customer!

  def index
    @address = Address.new
    #@addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:success] = "新しい配送先の登録が完了しました。"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      flash[:danger] = "新しい配送先内容に問題があります。"
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "配送先の変更を保存しました。"
      redirect_to addresses_path
    else
      flash[:danger] = "配送先変更ができませんでした。"
      render "edit"
    end
  end

  def destroy
  end

  private

def address_params
    params.require(:address).permit(:name, :postal_code, :address)
end

end
