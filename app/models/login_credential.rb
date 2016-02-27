class LoginCredential < ActiveRecord::Base
  include BCrypt

  belongs_to :user

  def password
    @password ||= Password.new(token)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.token = @password
  end

  def authentic_password?(_password)
    password == _password
  end

  def change_to_random_password
    random_password = Array.new(10).map{ (65+ rand(58)).chr }.join
    self.password = random_password
    self.save!
    random_password
  end


end
