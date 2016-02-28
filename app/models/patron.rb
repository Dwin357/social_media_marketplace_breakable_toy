class Patron < ActiveRecord::Base
  has_many :twitter_credentials
  has_many :login_credentials

  ###########  class  ##########
  # def self.find_from_session(params)
  #   user = User.find_by(username: params[:username])
  # end

  def self.from_twitter_data(omniauth)
    Patron.create(
      name: omniauth[:info][:name],
      username: omniauth[:info][:nickname],
      email: "",
      role: "patron"
      )
  end

end
