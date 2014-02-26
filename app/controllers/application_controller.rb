class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, alert: 'Eh necessario estar logado para acessar essa pagina'
    end
  end
  
  def user_logged
    if User.find_by_id(session[:user_id])
      redirect_to painel_path
    end
  end
  
  
end
