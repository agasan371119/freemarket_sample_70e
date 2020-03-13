class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def creare
    
  end


  private
  
  def item_params
    params.require(:item).permit(:name,:price)
  end

end
