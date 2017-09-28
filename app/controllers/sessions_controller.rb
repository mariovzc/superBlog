class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
  end
  
  def create
    if login(params[:email], params[:password])
      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash[:warning] = 'E-mail and/or password is incorrect.'
      redirect_to :log_in
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to root_path
  end
end