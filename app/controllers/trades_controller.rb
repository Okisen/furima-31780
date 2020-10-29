class TradesController < ApplicationController
  def index
    @item_trade = ItemTrade.new
    set_item
  end
  def create
    set_item
    @item_trade = ItemTrade.new(item_trade_params)
    if @item_trade.valid?
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
    params.require(:item_trade).permit(:postal_code, :prefecture_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
