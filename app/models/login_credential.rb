class LoginCredential < UserCredential
# class LoginCredential  < ActiveRecord::Base
  # belongs_to :patron, foreign_key: :user_id

  include BCrypt

  

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
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
