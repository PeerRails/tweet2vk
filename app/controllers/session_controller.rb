class SessionController < ApplicationController
  def sign_in
    #Why exception? Because I dont really know what can go wrong
    begin
      if current_user.nil?
        @omniauth = request.env['omniauth.auth']
        user = User.auth(@omniauth)
        Session.create!(
          user_id: user.id,
          ip: request.remote_ip,
          expires_at: DateTime.now + 60
          )
        res = {
          message: "User signed in!",
          name: user.full_name,
          signed: true
        }
      else
        res = {
          message: "User is already signed in!",
          name: user.full_name,
          signed: true
        }
      end
    rescue => e
      res = {
        message: "Something is broken!",
        error: e,
        signed: false
      }
    end
    render json: res
  end

  def sign_out
    if current_user
      @session = Session.find_by(session_id: session[:session_id])
      reset_session
      @session.expire
      flash[:success] = "Вышел"
    else
      flash[:danger] = "Оттуда ли ты вышел"
    end
    redirect_to root_url
  end

end
