class User < ActiveRecord::Base
  has_many :credentials, class_name: "UserCredential"

  def fake_authenticate?
    true
  end



  ###########  class  ##########
  # def self.find_from_session(params)
  #   user = User.find_by(username: params[:username])
  # end

  def self.from_twitter_data(omniauth)
    User.create(
      name: omniauth[:info][:name],
      username: omniauth[:info][:nickname],
      email: "",
      role: "patron"
      )
  end

end
