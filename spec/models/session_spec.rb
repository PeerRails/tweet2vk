require 'rails_helper'

RSpec.describe Session, type: :model do
  before do
    @user = Fabricate(:user)
    @session = Session.find_by_user_id(@user.id)
  end

  it "can be saved" do
    expired_session = Fabricate.build(:session)
    expired_session.user_id = @user.id
    expired_session.expires_at = DateTime.now - 1
    expired_session.save
  end

  it "should belong to user" do
    expect(@session.user_id).to eq(@user.id)
  end

  it "has expired sessions" do
    expired_session = Fabricate.build(:session)
    expired_session.user_id = @user.id
    expired_session.expires_at = DateTime.now - 1
    expired_session.save
    expired_sessions = Session.where(user_id: @user.id).expired.count
    expect(expired_sessions).to eq(1)
  end

  it "can expire" do
    @session.expire
    not_expired_sessions = Session.where(user_id: @user.id).not_expired.count
    expect(not_expired_sessions).to eq(4)
  end

end
