class Account < ActiveRecord::Base
  belongs_to :user

  def update_info(omni)
    update = {
        token: omni[:credentials][:token],
        profile_img_url: omni[:info][:image],
        nickname: omni[:info][:nickname],
        name: omni[:info][:name]
    }
    update[:secret] = omni[:credentials][:secret] unless omni[:credentials][:token].nil?
    self.update(update)
  end
end
