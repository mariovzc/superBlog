class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  
  def new
  end
  
  def create
    if login(params[:email], params[:password])
      flash[:success] = 'Bienvenido!'
      redirect_to root_path
    else
      flash[:warning] = 'Correo o contraseña incorrectos'
      redirect_to root_path
    end
  end

  def destroy
    logout
    flash[:success] = 'CHAOOOO!'
    redirect_to root_path
  end
end