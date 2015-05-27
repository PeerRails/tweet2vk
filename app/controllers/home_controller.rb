class HomeController < ApplicationController
  #start page
  def index
  end

  #login
  def login
    if !current_user
      flash[:error] = "Ну и че ты как лошара"
    end
  end

end
