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
    @item.item_images.new
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
    if @item.save
      redirect_to root_path
    else
      render :new, alert: '入力してくだい'
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:brand,:category_id,:postage,:prefecture,:day, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

end