class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
    @item_purchase_record = Item.find(params[:item_id])
  end  

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(purchase_record_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record).permit(:postal_code, :prefecture_id,
                    :municipalities, :house_number, :building_name, :phone_number, :purchase_record).
            merge(user_id: current_user.id)
  end
end
