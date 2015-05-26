require 'rails_helper'

RSpec.describe SessionController, type: :controller do

  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  describe '#sign_in with twitter' do

    it "should create new user" do
      expect{
        post :sign_in, provider: :twitter
        }.to change{ User.count }.by(1)
    end

    it "should create new account" do
      post :sign_in, provider: :twitter
      omni = request.env['omniauth.auth']
      expect(Account.last.uid).to eq(omni[:uid])
    end

    it "should create new session" do
      post :sign_in, provider: :twitter
      expect(User.last.id).to eq(Session.last.id)
    end

    it "should redirect user to root url" do
      post :sign_in, provider: :twitter
      response.should redirect_to root_url
    end
    
  end
end
