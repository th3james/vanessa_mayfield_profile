class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  before_filter :get_pages

  private

  def get_pages 
    @pages = Page.all
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    @current_user = current_user_session && current_user_session.record
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

end
