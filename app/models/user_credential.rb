class UserCredential < ActiveRecord::Base
  include BCrypt

  def password
    @password ||= Password.new(token)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.token = @password
  end

  def authentic?(_password)
    password == _password
  end

end
