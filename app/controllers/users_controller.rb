class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def change_role
    @user = User.find(params[:user_id])
    # @user.update_attributes!(role: new_role)
    if @user.standard?
      @user.premium!
    else
      @user.standard!
      @user.wikis.where(private: true).each do |wiki|
        wiki.update_attributes!(private: false)
      end
    end
    
    redirect_to edit_user_registration_path
  end
end