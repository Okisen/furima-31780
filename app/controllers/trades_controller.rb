class TradesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    set_item
    if !@item.trade.nil?
      redirect_to root_path
    elsif current_user.id == @item.user.id
      redirect_to root_path
    end
    @item_trade = ItemTrade.new
  end

  def create
    set_item
    @item_trade = ItemTrade.new(item_trade_params)
    if @item_trade.valid?
      pay_item
      @item_trade.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_trade_params
    params.require(:item_trade).permit(:postal_code, :prefecture_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_trade_params[:price],
      card: item_trade_params[:token],
      currency: 'jpy'
    )
  end
end
