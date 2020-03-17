class ItemsController < ApplicationController


  def index
    @items = Item.all
  end
  
  def buy
  end

  def new
    @item = Item.new
  end

  def creare
    
  end


  private
  
  def item_params
    params.require(:item).permit(:name,:price, buyer_id:current_user_id)
  end

end
