class UsersController < ApplicationController
  def me
    sessionExist
  end

  def me_edit
    sessionExist    
  end

  def update
    p_params = permit_update_params
    User.transaction do
      @user = User.update(
        name: p_params[:user][:name].to_s,
        email: p_params[:user][:email].to_s,
        password: p_params[:user][:password].to_s,
      )
    end
    redirect_to('/users/me') and return
  end

  private
  def sessionExist
    if (session[:user])
      id = session[:user]['id']
      @user = User.find(id)
    else
      redirect_to('/login') and return
    end
  end

  def permit_update_params
    params.permit(user: [:name, :email, :password])
  end

end
