class User < ActiveRecord::Base
  has_many :medicinetousers
  has_many :measurement

  def self.from_omniauth(auth)
    where(provider: auth.provider, user_id: auth.user_id).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.user_id = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = auth.info.username
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.save!
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end