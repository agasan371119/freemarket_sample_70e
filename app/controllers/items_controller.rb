class ItemsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :buy]


  def index
    @items = Item.all.limit(5).order("created_at DESC")



    @ladies = Item.where(category_id: 5).limit(5).order("created_at DESC")
    @mens = Item.where(category_id: 139).limit(5).order("created_at DESC")
    @categories = Category.where(ancestry: nil)
  end

  def category_children_index
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def buy
    @item = Item.find(params[:id])
    @address = Address.find_by(user_id: current_user.id)
  end

  def sold
    item.update(buyer_id: current_user.id)
    redirect_to root_path
    # TODO: やる内容
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

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show

    
    grand_child_category = @item.category
    # binding.pry
    child_category = grand_child_category.parent
    
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = ["選択してください"]
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children.name
    end

    @category_grandchildren_array = ["選択してください"]
    Category.where(ancestry: grand_child_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren.name
    end
  end
  

  def update
    if @item.update(item_params)
       redirect_to root_path
    else
      flash[:alert] = '編集に失敗しました。必須項目を確認してください。'
      redirect_to edit_item_path
    end
  end

  
  def buy
    @address = Address.find_by(user_id: current_user.id)
  end

  def sold
    item = Item.find(params[:id])
    if item.update(buyer_id: current_user.id)
      redirect_to root_path
    else 
      flash[:alert] = 'クレジットカード情報を入力して下さい'
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
