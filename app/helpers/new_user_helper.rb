module NewUserHelper
  def active_is_patron?(active)
    active == "patron"
  end

  def active_is_venue?(active)
    active == "venue"
  end

  def active_is_artist?(active)
    active == "artist"
  end
end