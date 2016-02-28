class Venue < User
  has_many :login_credentials
  has_many :events
end
