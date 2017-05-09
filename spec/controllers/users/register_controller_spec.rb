require 'rails_helper'

RSpec.describe Users::RegisterController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      expect { post :create }.to change(User, :count).by(1)
      expect(response).to have_http_status(:success)
      expect(:create => "users/register").to route_to(:action => "thanks")
    end
  end

end
