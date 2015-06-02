class TweetsController < ApplicationController
  before_action :auth_json

  def last
    list = twtr.user_timeline(tweet_params[:account_id])
    render json: list
  end

  def show
    tweet = twtr.tweet(:tweet_id)
  end

  def tweet_params
    params.permit(:account_id, :tweet_id)
  end
end
