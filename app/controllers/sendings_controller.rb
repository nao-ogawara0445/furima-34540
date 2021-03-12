class SendingsController < ApplicationController
  before_action :authenticate_user!
  def index
 
    @sending_form = SendingForm.new
    @item=Item.find(params[:item_id])
    purchase_items_sending
    
  end


  def create
    @item=Item.find(params[:item_id])
    
    @sending_form = SendingForm.new(sending_params)
    
    if @sending_form.valid?
      sending_item
      
      @sending_form.save
      redirect_to root_path
    else
      @item=Item.find(params[:item_id])
      render :index
    end
  end
  private

  def sending_params
    params.require(:sending_form).permit(:postal_code,:shipping_id, :town,:address, :building,:tel,:purchase).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
  def sending_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: @sending_form.token,   
      currency: 'jpy'                 
    )
  end
  def purchase_items_sending
    redirect_to root_path if (current_user == @item.user )|| @item.purchase 
    
  end
  
  
end
