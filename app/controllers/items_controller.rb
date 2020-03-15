class ItemsController < ApplicationController


  def index
    @items = Item.all
  end
  
  def buy
  end

  def new
    @item = Item.new
    @category_parent_array = ["選択してください"]
    categories = Category.where(ancestry: nil)
    categories.each do |parent|
      @category_parent_array << parent.name
   end
  end

  def category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children

  end

 
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    
  end


  private
  
  def item_params
    params.require(:item).permit(:name,:price)
  end

end
