class HomeController < ApplicationController
  before_filter :auth, except: [:login, :index]
  #start page
  def index
  end

  #login
  def login
    if !current_user
      flash[:error] = "Залогинься через Вк или Твиттер. Ты потом их объедини в настройках"
    else
      flash[:error] = "Вы уже залогинены!"
      redirect_to root_url
    end
  end

end
