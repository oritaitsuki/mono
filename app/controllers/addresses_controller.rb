class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :get_item_params, only: [:index, :create]
  
  
  def index
    @user_item_address = UserItemAddress.new
  end

  def create
    @user_item_address = UserItemAddress.new(user_item_address_params)
    if @user_item_address.valid?
      pay_item
      @user_item_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

private

def get_item_params
  @item = Item.find(params[:item_id])
end

def user_item_address_params
  params.require(:user_item_address).permit(:post_number, :prefectures_id, :city, :phone_number,
                                            :building_name, :address).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.value,
    card: user_item_address_params[:token],
    currency: 'jpy'
  )
end

end

