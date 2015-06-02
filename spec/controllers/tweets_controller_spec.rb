require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe "GET #last" do
    it "returns http success" do
      get :last
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
