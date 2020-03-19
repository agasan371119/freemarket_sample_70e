class UsersController < ApplicationController

  def credit
  end

  def new
  end

  def show
     @user = User.find(1)
  end

  def logout
  end

end
