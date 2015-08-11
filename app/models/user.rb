class User < ActiveRecord::Base
  devise :rememberable,
         :trackable,
         :omniauthable,
         :omniauth_providers => [:google_oauth2]

  before_validation :has_permitted_domain?

  def self.from_omniauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      # user.firstname = auth.info.first_name
      # user.lastname = auth.info.last_name
    end
    # user.google_image_url = auth.info.image.nil? ? '' : auth.info.image.split("?")[0]
    user
  end

  PERMITTED_DOMAINS = ['@hitfoxgroup.com', '@applift.com', '@finleap.com']

  def has_permitted_domain?
    PERMITTED_DOMAINS.include?(self.email.match(/@.*/).to_s)
  end
end
