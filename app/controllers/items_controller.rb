class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :buy]

  def index
    @items = Item.all.limit(5).order("created_at DESC")
    @ladies = Item.where(category_id: 5).limit(5)
    @mens = Item.where(category_id: 139).limit(5)
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
  end

  def update
    @item.update(item_update_params)
    if item.user_id == current_user.id
      item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
  end
  
  def buy
    @address = Address.find_by(user_id: current_user.id)
  end

  def sold
    item = Item.find(params[:id])
    if item.update(buyer_id: current_user.id)
      redirect_to root_path
    else 
      render :buy
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name,:price,:description,:status,:brand,:category_id,:postage_id,:prefecture_id,:day_id, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(
      :name,:price,:description,:status,:brand,:category_id,:postage_id,:prefecture_id,:day_id, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end


  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
