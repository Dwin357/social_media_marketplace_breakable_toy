class UserCredential < ActiveRecord::Base
  include BCrypt
  
  belongs_to :user

  AUTHENTICATORS = [LOGIN = 'login', TWITTER = 'twitter']
  # user.credentials.find_by(authenticator: "format").authenticate

  validates :authenticator, inclusion: {in: AUTHENTICATORS}

  def password
    @password ||= Password.new(token)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.token = @password
  end

  def authentic?(_password = nil)
    password == _password
  end

  def change_to_random_password
    random_password = Array.new(10).map{ (65+ rand(58)).chr }.join
    self.password = random_password
    self.save!
    random_password
  end


  #############  class methods  ##########


  def self.new_credentials_for(user, params)
    # params right now will only have password and is just for self-signup
    #this will need more complicated logic when multiple options (ie twitter, FB, etc)
    credential = UserCredential.new(params)
    credential.authenticator = "login" 
    user.credentials << credential
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
      user = User.from_twitter_data(omniauth)
      TwitterCredential.from_twitter_data(omniauth, user)
      user
    else
      twitter_credential.user
    end
  end

end
