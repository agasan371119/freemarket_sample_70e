class ItemsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :destroy, :buy, :update]

  require 'payjp'


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
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
    @category_parent_array = ["選択してください"]
    @categories = Category.where(ancestry: nil)
    categories = Category.where(ancestry: nil)
    categories.each do |parent|
      @category_parent_array << parent.name
   end
  end

  def category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end

 
  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  
  def create
    @item = Item.new(item_params)
    @category_parent_array = ["選択してください"]
    @categories = Category.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to new_item_path
    end
  end


  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      render :edit
    end
  end

  
  def buy
    @address = Address.find_by(user_id: current_user.id)
  end

  def sold
    item = Item.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.nil?
      # flash[:alert] = 'クレジットカード情報を入力して下さい'
      redirect_to controller: "card", action: "new", notice: 'クレジットカード情報を入力して下さい'
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id) 
      @default_card_information = customer.cards.retrieve(card.card_id)
      Payjp::Charge.create(
        amount: item.price, 
        customer: card.customer_id,
        currency: 'jpy',              
      )
      if item.update(buyer_id: current_user.id)
        redirect_to root_path
      else  
        render :buy
      end
    end
  end

  def pay
    card = Card.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: @item.price, 
      customer: card.customer_id,
      currency: 'jpy',              
    )
    redirect_to root_path
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
