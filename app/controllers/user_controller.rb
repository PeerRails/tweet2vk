class UserController < ApplicationController
  before_filter :auth_json, only: :me
  def me
    accounts = Account.where(user_id: current_user.id)
    res = {"twitter": {}, "vk": {}}
    accounts.each do |a|
      res["#{a.provider}"] = {
        name: a.name,
        uid: a.uid,
        url: a.url,
        nickname: a.nickname,
        profile_img_url: a.profile_img_url
      }
    end
    render json: res
  end
end
