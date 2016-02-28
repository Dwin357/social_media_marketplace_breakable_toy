class Venue < ActiveRecord::Base
  has_many :login_credentials
end
