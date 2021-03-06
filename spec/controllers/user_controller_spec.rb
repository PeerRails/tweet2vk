require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "#me with twitter" do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      session[:session_id] = "MySession"
      @user = Fabricate.build(:user)
      @user = User.auth(request.env['omniauth.auth'], Faker::Internet.ip_v4_address)
      @current_session = Session.create!(session_id: session[:session_id], user_id: @user, expires_at: DateTime.now + 20)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    it "returns user account info" do
      get :me
      res = JSON.parse(response.body)
      exp_response = "John Q Public"
      expect(res["twitter"]["name"]).to eql(exp_response)
    end

  end

  describe "#me with vk" do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:vk]
      session[:session_id] = "MySession2"
      @user = Fabricate.build(:user)
      @user = User.auth(request.env['omniauth.auth'], Faker::Internet.ip_v4_address)
      @current_session = Session.create!(session_id: session[:session_id], user_id: @user, expires_at: DateTime.now + 20)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    it "returns user account info" do
      get :me
      res = JSON.parse(response.body)
      exp_response = 'Павел Дуров'
      expect(res["vk"]["name"]).to eql(exp_response)
    end

  end

end
