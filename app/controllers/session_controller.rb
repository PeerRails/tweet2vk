class SessionController < ApplicationController
  def sign_in
    @omniauth = request.env['omniauth.auth']
    user = User.select("accounts.uid uid, accounts.provider provider, users.*")
      .joins(:accounts)
      .where(accounts: { uid: @omniauth[:uid], provider: @omniauth[:provider] })
      .first_or_create do |u|
        u.last_ip = request.remote_ip
        u.last_login = DateTime.now
        u.profile_img = 'https://avatars3.githubusercontent.com/u/765160?v=3&s=460'
        u.email = 'nothing'
        u.full_name = @omniauth[:info][:name]
        u.save
        account = Account.new
      end

  end

  def sign_out
  end

  private
  def create
  end
  
  private
  def destroy
  end
end
