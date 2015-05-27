class Session < ActiveRecord::Base
  belongs_to :user
  scope :expired, -> { where("expires_at < ?", DateTime.now) }
  scope :not_expired, -> { where("expires_at > ?", DateTime.now) }

  def expire
    self.update_column(:expires_at, DateTime.now)
    self.save
  end
end
