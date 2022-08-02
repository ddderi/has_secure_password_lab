class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    # user = User.find_by(name: params[:name])
    # user = user.try(:authenticate, params[:password])
    # return redirect_to(controller: 'sessions', action: 'new') unless user
    # session[:user_id] = user.id
    # @user = user
    redirect_to controller: 'welcome', action: 'home'
  end

  def destroy
    session.delete session[:name]
    redirect_to '/login'
  end
end
