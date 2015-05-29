class HomeController < ApplicationController
  before_filter :auth, except: [:login, :index]
  # start page
  def index
    
  end

  # login
  def login
    
  end

end
