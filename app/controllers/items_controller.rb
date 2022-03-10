class ItemsController < ApplicationController
  before_action :authenticate_user! [:new]
  def index
   @items = Item.includes(:user)
   end

  def new
    @item = Item.new
  end
  

  def create
    @item = Item.new(itme_params)
    if @object.save
      redirect_to root_path
    else
      render :new
    end
  end
  
    
  end
  
  
   private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
