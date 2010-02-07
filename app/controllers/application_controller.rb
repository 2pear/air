# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation

  def current_user
    User.find(session[:user_id])
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      puts "redirecting to #{session[:return_to]}"
      session[:return_to] = nil
      redirect_to return_to
    else
      redirect_to :controller => "users", :action => "index"
    end
  end

  before_filter :authenticate

  protected
  def authenticate
    case request.format
    when Mime::XML, Mime::ATOM, Mime::Type.new('application/json')
      unless (session[:user_id] or
              user_id = authenticate_with_http_basic { |u, p| User.authenticate(u, p) })
        request_http_basic_authentication
      end
    else
      unless session[:user_id]
        flash[:warning] = "Please login to continue"
        session[:return_to] = request.request_uri
        redirect_to :controller => "users", :action => "login" and return false
      end
    end
  end
end
