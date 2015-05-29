class SessionController < ApplicationController
  def sign_in
    #Why exception? Because I dont really know what can go wrong
    begin
      @omniauth = request.env['omniauth.auth']
      unless signed_in?
        user = User.auth(@omniauth, request.remote_ip)
        Session.create!(
          session_id: session[:session_id],
          user_id: user.id,
          ip: request.remote_ip,
          expires_at: DateTime.now + 60
          )
        flash[:success] = "Залогинены!"
      else
        @account = Account.find_by(uid: @omniauth[:uid], provider: @omniauth[:provicer])
        if @account.nil?
          user.add_account(@omniauth)
        else
          @account.update_info(@omniauth)
        end
        flash[:success] = "Добавлена новая авторизация!"
      end
    rescue => e
      flash[:danger] = "А у нас тут ошибка сервера"
    end
    redirect_to root_url
  end

  def sign_out
    if signed_in?
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
