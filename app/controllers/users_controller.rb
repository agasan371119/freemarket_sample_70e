class UsersController < ApplicationController

  def credit
  end

  def new
  end

  def show
     @user = User.find(params[:id])
  end

  def logout
  end

end
