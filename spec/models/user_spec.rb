require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = Fabricate.build(:user)
  end

  it "should create new user" do
    user = Fabricate.build(:user)
    user.save
    expect(user.id).to eq(User.last.id)
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

end
