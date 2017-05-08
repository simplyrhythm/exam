class UsersController < ApplicationController
  def me
    if (session[:user])
      id = session[:user]['id']
      @user = User.find(id)
    else
      redirect_to('/login') and return
    end
  end

  def me_edit
  end
end
