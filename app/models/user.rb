class User < ActiveRecord::Base

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