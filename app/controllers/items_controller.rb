class ItemsController < ApplicationController


  def index
    @items = Item.all
  end
  
  def buy
  end

end
