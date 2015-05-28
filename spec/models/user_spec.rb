require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = Fabricate.build(:user)
    @omni = OmniAuth.config.mock_auth[:twitter]
  end

  it "should create new user" do
    expect {
      user = User.auth(@omni, Faker::Internet.ip_v4_address)
      }.to change{ User.count }.by(1)
  end

  it "should update user" do
    user = Fabricate(:user)
    @omni[:info][:name] = 'John'
    updated_user = User.auth(@omni, Faker::Internet.ip_v4_address)
    expect(updated_user.id).to eq(user.id)
  end

  it "should create new account with new twitter" do
    expect{
      user = Fabricate(:user)
      }.to change{ Account.count }.by(1)
  end

  it "should have session" do
    user = Fabricate(:user)
    session = Session.find_by(user_id: user.id)
    expect(session.user_id).to eq(user.id)
  end

  it "should throw error without omniauth data" do
    @user.omni = nil
    @user.save
    expect(@user.id).to eq(nil)
  end

  it "should add account" do
    user = Fabricate(:user)
    omni = OmniAuth.config.mock_auth[:vk]
    user.add_account(omni)
    expect(Account.where(user_id: user.id).count).to eql(2)
  end


end
