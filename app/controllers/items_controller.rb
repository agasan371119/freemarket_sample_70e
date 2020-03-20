class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(5).order("created_at DESC")
    @ladies = Item.where(category_id: 5).limit(5)
    @mens = Item.where(category_id: 138).limit(5)
    @categories = Category.where(ancestry: nil)
    @category_children = Category.find_by(params[:parent_name]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @item = Item.find(1)
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

  def buy
    @item = Item.find(17)
    @address = Address.find_by(user_id: current_user.id)
  end

  def sold
    item = Item.find(params[:id])
    item.save(buyer_id: current_user.id)
    if item.save
      redirect_to root_path
  else
    flash.now[:alert] = "クレジットカードを登録して下さい"
      render :buy
    end
  end

  private
  def item_params
    params.require(:item).permit(:name,:price)
  end
end
