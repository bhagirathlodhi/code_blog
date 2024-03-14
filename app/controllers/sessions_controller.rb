class SessionsController < ApplicationController
  def create
    user = User.find_by(full_name: params[:user][:full_name])

    if user && user.valid_password?(params[:user][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid full name or password"
      render :new
    end
  end
end
