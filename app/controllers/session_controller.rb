class SessionController < ApplicationController
  def sign_in
    @omniauth = request.env['omniauth.auth']
    
    render json: response
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
