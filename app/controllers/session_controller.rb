class SessionController < ApplicationController
  def sign_in
    @omniauth = request.env['omniauth.auth']
    User.select("accounts.uid uid, accounts.provider provider, users.*").where(uid: @omniauth[:uid], provider: @omniauth[:provider]).first_or_create do |user|
      #what to do?!
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
