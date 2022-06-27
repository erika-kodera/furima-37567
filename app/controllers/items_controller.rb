class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :destroy]
  before_action :sold_out_url, only: [:edit]

  def index
    @items = Item.all.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :info, :category_id, :condition_id, :shipping_charge_id,
                                 :prefecture_id, :shipping_time_id, :price, {images: []}).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def prevent_url
    redirect_to action: :index if @item.user_id != current_user.id
  end

  def sold_out_url
    redirect_to root_path unless @item.purchase_record.nil?
  end
end
