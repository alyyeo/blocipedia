class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def to_premium
    change_role(:premium)
  end
  
  def to_standard
    change_role(:standard)
  end
  
  def change_role(new_role)
    @user = User.find(params[:user_id])
    # @user.update_attributes!(role: new_role)
    new_role == :premium ? @user.premium! : @user.standard!
    redirect_to edit_user_registration_path
  end
end