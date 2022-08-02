class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params)
    
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to '/login'
    # else 
    #   redirect_to new_user_path
    # end
    @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id 
        redirect_to controller: 'welcome', action: 'home'
    
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
    
  end
end
