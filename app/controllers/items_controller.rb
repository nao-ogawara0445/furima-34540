class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :set_items,only: [:destroy,:show,:edit,:update]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def index
    @items=Item.order("created_at DESC")
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

  def show
  end
  def edit
  end
  def update
    if @item.update(item_params)
      redirect_to  "/items/#{@item.id}"
    else
      render :edit
    end
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end
  private
  def item_params
    params.require(:item).permit(:image,:item_name,:item_exposition,:price,:category_id,:status_id,:postage_id,:shipping_id,:day_id).merge(user_id: current_user.id)
  end
  def set_items
    @item=Item.find(params[:id])
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
