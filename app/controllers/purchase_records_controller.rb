class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record = PurchaseRecords.all
  end
  
  def new
    @purchase_record = PurchaseRecords.new
  end
  

  def create
    
    binding.pry
    
    @purchase_record = PurchaseRecords.new(purchase_record_params)
    if @purchase_record.valid?
      @purchase_record.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_record).
    permit(:postal_code, :prefectures, :municipalities, :house_number, :building_name, :phone_number, :purchase_record).
    merge(user_id: current_user.id)
  end
end
