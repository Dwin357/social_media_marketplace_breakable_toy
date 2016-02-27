class TwitterCredential < ActiveRecord::Base
  belongs_to :user


  ###### class methods ######

  def self.from_twitter_data(omniauth, user)
    TwitterCredential.create(user:user, 
                             uid:omniauth[:uid], 
                             auth_token: omniauth[:credentials][:token],
                             auth_secret: omniauth[:credentials][:secret]
                            )
  end
end