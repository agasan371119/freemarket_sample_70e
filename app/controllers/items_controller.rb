class ItemsController < ApplicationController
  # before_action :set_item, except: [:new, :create]

  def index
    @items = Item.all
  end
  
  def show
  end
  
  def buy
  end
  
  def new
    @item = Item.new
    @images = @item.item_images.build
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
    @item = Item.new(item_params)
    @category_parent_array = ["選択してください"]
    categories = Category.where(ancestry: nil)
    categories.each do |parent|
      @category_parent_array << parent.name
   end
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to new_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_update_params)
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:brand,:category_id,:postage_id,:prefecture_id,:day_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

end