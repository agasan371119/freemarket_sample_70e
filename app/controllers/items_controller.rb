class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  

  def show
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

  def destroy
  end


  def edit
    # @item = Item.find(params[:id])
    @user = current_user
    # @item_images = Item_images.where(item_id: @item)
    @category_parent_array = ["選択してください"]
    categories = Category.where(ancestry: nil)
    categories.each do |parent|
      @category_parent_array << parent.name
    end
    
  end

  def update
  end



  private
  
  # def item_params
  #   params.require(:item).permit(:name,:price)
  # end
  def item_params
    params.require(:item).permit(:user_id, :name, :description, :category_id, :brand, :status, :size, :price, :buyer_id, :postage, :prefecture, :day)
  end

end
