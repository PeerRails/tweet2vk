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
      expect(Account.last.uid).to eq(omni[:uid].to_i)
    end

    it "should create new session" do
      post :sign_in, provider: :twitter
      expect(User.last.id).to eq(Session.last.user_id)
    end

    #ajax was a mistake
    it "should redirect to root" do
      post :sign_in, provider: :twitter
      expect(response).to redirect_to root_url
    end
    
  end

  describe "#sign_out with twitter" do
    before do
      session[:session_id] = "MySession"
      @current_session = Session.create!(session_id: session[:session_id], user_id: @current_user, expires_at: DateTime.now + 20)
      allow(controller).to receive(:current_user).and_return(Fabricate(:user))
    end

    it "redirects to root url" do
      get :sign_out
      expect(response).to redirect_to root_url
    end

    it "should reset session" do
      get :sign_out
      expect(session[:session_id]).not_to eql("MySession")
    end
  end
end
