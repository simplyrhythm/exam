require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #me" do
    it "returns http success" do
      get :me
      expect(response).to have_http_status(:success)
    end
  end

end
