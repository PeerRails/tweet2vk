require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @user = Fabricate(:user)
    @account = Account.find_by_user_id(@user.id)
  end

  it "should belong to user" do
    expect(@account.user_id).to eq(@user.id)
  end

end
