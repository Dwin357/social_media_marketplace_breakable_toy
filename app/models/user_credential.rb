class UserCredential < ActiveRecord::Base
  
  
  belongs_to :patron

  AUTHENTICATORS = [LOGIN = 'login', TWITTER = 'twitter']
  # user.credentials.find_by(authenticator: "format").authenticate

  validates :authenticator, inclusion: {in: AUTHENTICATORS}

  


  #############  class methods  ##########


  def self.new_login_credentials_for(patron, params)
    # params right now will only have password and is just for self-signup
    #this will need more complicated logic when multiple options (ie twitter, FB, etc)
    
    patron.login_credentials << LoginCredential.new(password: params[:password])
  end

  def self.find_or_create_user_from_omni(omniauth)
    case omniauth[:provider]
    when "twitter"
      self.find_or_create_user_from_twitter(omniauth)
    end
  end

  def self.find_or_create_user_from_twitter(omniauth)
    twitter_credential = TwitterCredential.find_by(uid: omniauth[:uid])
    if twitter_credential.nil?
      user = Patron.from_twitter_data(omniauth)
      TwitterCredential.from_twitter_data(omniauth, user)
      user
    else
      twitter_credential.user
    end
  end

end
