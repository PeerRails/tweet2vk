class Account < ActiveRecord::Base
  belongs_to :user

  def update_info(omni)
    self.update(
        token: omni[:credentials][:token],
        profile_img_url: omni[:info][:image],
        nickname: omni[:info][:nickname],
        name: omni[:info][:name],
      )
  end
end
