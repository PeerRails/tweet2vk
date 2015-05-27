class User < ActiveRecord::Base
  has_many :sessions
  has_many :accounts
  attr_accessor :omni
  after_create :add_account
  validates :omni, presence: true

  def add_account
    omni = self.omni
    account = Account.new(
        provider: omni[:provider],
        uid: omni[:uid],
        token: omni[:credentials][:token],
        profile_img_url: omni[:info][:image],
        nickname: omni[:info][:nickname],
        name: omni[:info][:name],
        user_id: self.id
      )
    account.url = omni[:provider] == 'twitter' ? omni[:info][:urls]["Twitter"] : omni[:info][:urls]["VKontakte"]
    account.save
  end
end
