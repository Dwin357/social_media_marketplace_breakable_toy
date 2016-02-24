class UserCredential < ActiveRecord::Base
  include BCrypt

  AUTHENTICATORS = [LOGIN = 'login', TWITTER = 'twitter']

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

end
