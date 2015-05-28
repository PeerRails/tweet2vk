class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # :nocov:
  private
  def twtr
    @twtr ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  private
  def vklient
    @vklient = VkontakteApi::Client.new(ENV['APP_SECRET'])
  end

  private
  def auth
    if current_user.nil?
      redirect_to login_path(path: request.path)
    end
  end

  def auth_json
    if current_user.nil?
      error = {error: 403, message: "Not Authorized"}
      render json: error
    end
  end

  private
  def current_user
    @current_user ||= User.select("users.*, sessions.ip, sessions.expires_at").joins(:sessions).where(sessions: {session_id: session[:session_id]}).last if session[:session_id].present?
    if @current_user && @current_user.expires_at < DateTime.now
      reset_session
      @current_user = nil
    end
    return @current_user
  end

  private
  def vku
    @vku ||= Account.find_by(user_id: current_user.id, provider: 'vk') if current_user
    return @vku
  end

  private
  def twu
    @twu ||= Account.find_by(user_id: current_user.id, provider: 'twitter') if current_user
    return @vku
  end
  helper_method :current_user, :vku, :twu
  # :nocov:

end
