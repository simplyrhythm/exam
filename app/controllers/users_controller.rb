class UsersController < ApplicationController
  def me
    id = session[:user]['id']
    @user = User.find(id)
  end

  def me_edit
  end
end
