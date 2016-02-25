class UserCredential < ActiveRecord::Base
  include BCrypt

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

end
