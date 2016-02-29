class User < ActiveRecord::Base

  self.abstract_class=true

  has_one :login, class_name: :LoginCredential, as: :loginable

  def patron?
    self.class.to_s == "Patron"
  end

  def venue?
    self.class.to_s == "Venue"
  end

  def artist?
    self.class.to_s == "Artist"
  end
end