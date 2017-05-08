class UsersController < ApplicationController
  def me
    sessionExist
  end

  def me_edit
    sessionExist    
  end

  def update
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
end
