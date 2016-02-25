class User < ActiveRecord::Base
  has_many :credentials, class_name: "UserCredential"

  def fake_authenticate?
    true
  end



  ###########  class  ##########
  # def self.find_from_session(params)
  #   user = User.find_by(username: params[:username])
  # end

  def self.find_from_omniauth(omniauth = nil)
    if omniauth != nil
      User.first
    end
  end

end
