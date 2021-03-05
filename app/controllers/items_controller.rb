class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  
  def index
    @items=Item.all.order("created_at DESC")
  end
  def new
    @item=Item.new
  end
  def create
    
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:item_name,:item_exposition,:price,:category_id,:status_id,:postage_id,:shipping_id,:day_id).merge(user_id: current_user.id)
  end
end
