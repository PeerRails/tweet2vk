class SessionController < ApplicationController
  def sign_in
    @omniauth = request.env['omniauth.auth']
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
