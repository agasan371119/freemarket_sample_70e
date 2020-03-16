

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]


  def new
    @user = User.new
  end

  def create
    
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    if @user.save
    sign_in(:user, @user)
    else
      new_user_registration_path
    end
  end
 
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  protected
  def address_params
    params.require(:address).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture, :city, :address_block, :building_name, :room_number, :phone_number)
  end

  def after_sign_up_path_for(resource)
    root_path
  end
  # private 
  # def sign_up_params
  #   params.require(:user).permit(:sign_up, keys: [:nickname, :familyname, :firstname, :familyname_kana, :firstname_kana, :birth_year, :birth_month, :birth_day, :introduction, :image])
  # end
end