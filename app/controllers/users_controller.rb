class UsersController < ApplicationController
  before_action :move_to_index
  def credit
  end

  def new
  end

  def show
    @user = User.find(params[:id])
    @item = Item.find_by(buyer_id: @user.id)

  end

  def logout
  end

end

private

def move_to_index
  redirect_to root_path unless user_signed_in?
end
