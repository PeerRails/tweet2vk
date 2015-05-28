class SessionController < ApplicationController
  def sign_in
    #Why exception? Because I dont really know what can go wrong
    begin
      if current_user.nil?
        @omniauth = request.env['omniauth.auth']
        user = User.auth(@omniauth, request.remote_ip)
        Session.create!(
          session_id: session[:session_id],
          user_id: user.id,
          ip: request.remote_ip,
          expires_at: DateTime.now + 60
          )
        flash[:success] = "Залогинены!"
      else
        flash[:danger] = "Вы уже залогинены!"
      end
    rescue => e
      flash[:danger] = "А у нас тут ошибка сервера"
    end
    redirect_to root_url
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
