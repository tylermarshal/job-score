class User < ApplicationRecord

  has_many :resumes, dependent: :destroy
  has_many :cover_letters, dependent: :destroy
  has_many :jobs, dependent: :destroy

  def self.from_omniauth(auth_info)
    user = find_by(uid: auth_info[:uid])
    if user.nil?
      create do |new_user|
        self.create_or_update(new_user, auth_info)
      end
    else
      if user.updated_at + user.expires.to_i >= Time.now
        user
      else
        self.create_or_update(user, auth_info)
        user.save!
      end
    end
  end

  def self.create_or_update(user_type, auth_info)
    user_type.uid                    = auth_info.uid
    user_type.name                   = auth_info.info.name
    user_type.email                  = auth_info.info.email
    user_type.token                  = auth_info.credentials.token
    user_type.token_secret           = auth_info.credentials.secret
    user_type.expires                = auth_info.extra.access_token.params[:oauth_expires_in]
  end
end
