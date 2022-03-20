class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :new, :create]
  before_action :prevent_url, only: [:index, :new, :create]

  def index
    @order = Order.new
  end  

  def new
    @order = Order.new
  end
  
  def create
      @order = Order.new(purchase_record_params)
    if @order.valid?
      Payjp.api_key = "sk_test_96d98e8a410b2d6aaaaa85e0"
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      @item_purchase_record = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:order).permit(:postal_code, :prefecture_id,
                    :municipalities, :house_number, :building_name, :phone_number, :purchase_record).
            merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item_purchase_record = Item.find(params[:item_id])
  end

  def prevent_url
    if @item_purchase_record.user_id == current_user.id || @item_purchase_record.purchase_record != nil
      redirect_to root_path
    end
  end
end
