require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  describe "GET #list" do
    it "returns users groups" do
      get :list
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #info" do
    it "returns group info" do
      get :info
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #wall" do
    it "returns group wall" do
      get :wall
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #wall_post" do
    it "returns group wall post" do
      get :wall_post
      expect(response).to have_http_status(:redirect)
    end
  end

end
