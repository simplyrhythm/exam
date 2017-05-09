class Users::RegisterController < ApplicationController
  def index
    @user = User.new
  end

  def thanks
  end

  def create
    p_params = permit_create_params
    User.transaction do
      @user = User.create!(
        name: p_params[:user][:name].to_s,
        email: p_params[:user][:email].to_s,
        password: p_params[:user][:password].to_s,
      )
    end
    redirect_to('/users/register/thanks') and return
  rescue => e
    case e
    when ActiveRecord::RecordInvalid
      @user = e.record
      render action: :index and return
    end
  end

  private
  def permit_create_params
    params.permit(user: [:name, :email, :password])
  end



end
