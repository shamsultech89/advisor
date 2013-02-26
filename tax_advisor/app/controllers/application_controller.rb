class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :is_login?, :is_admin?

  private
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end



  def is_login?
    if current_user
      return true
    else
      return false
    end
  end

  def login_required
    redirect_to root_url unless is_login?
  end

  def is_admin?
    if current_user
      if current_user.account_type_id == AccountType::ADMIN
        return true
      else
        return false
      end
    else
      return false
    end
  end
  def user_layout
    is_admin? ? "admin" : "application"
  end
  
  
end
