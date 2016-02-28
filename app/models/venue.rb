class Venue < ActiveRecord::Base
  has_many :login_credentials
  has_many :events
end
