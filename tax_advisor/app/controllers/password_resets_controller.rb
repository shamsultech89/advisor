class PasswordResetsController < ApplicationController

  def new
    
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user
      user.send_password_reset
      redirect_to root_url, :notice => "Password reset instructions sent."
    else
      flash.now.alert = "Could not find a user with that email address."
      render "new"
      #redirect_to new_password_reset_path, flash.now.alert = "Could not find a user with that email address."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

end
