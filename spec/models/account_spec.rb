require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @user = Fabricate(:user)
    @account = Account.find_by_user_id(@user.id)
    @omni = OmniAuth.config.mock_auth[:twitter]
    @omni[:uid] = '9999'
  end

  it "should belong to user" do
    expect(@account.user_id).to eq(@user.id)
  end

  it "should update info" do
    account = Fabricate(:account)
    account.update_info(@omni)
    expect(@account.uid).to eq(9999)
  end

end
