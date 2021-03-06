class SessionsController < ApplicationController
  def new
    if (session[:user])
      redirect_to('/users/me') and return
    end
  end

  def create
    p_params = permit_create_params
    user = User.authenticate(p_params[:email], p_params[:password])
    if user
      session[:user] = {
        id: user.id,
        name: user.name,
        last_logined_at: DateTime.now
      }
      redirect_to('/users/me') and return
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def delete
    session[:user] = nil
    redirect_to('/') and return
  end

  private
  def permit_create_params
    params.permit([:email, :password])
  end

end
