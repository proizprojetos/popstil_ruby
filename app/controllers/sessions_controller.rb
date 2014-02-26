class SessionsController < ApplicationController
  before_filter :user_logged, only: [:new]
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to login_url, alert: "Seja bem vindo"
    else
      redirect_to login_url, alert: 'E-mail ou senha incorretos'
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: 'Logout realizando com sucesso'
  end
end
