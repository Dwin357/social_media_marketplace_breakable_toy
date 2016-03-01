class Promoter < User
  self.abstract_class=true

  # totally bogus association between two abstract classes
  has_many :social_functions


  # this doesn't work b/c the >= syntax fails, but this is the idea
  # def upcoming_events
  #   self.social_functions.where(showtime: >= Time.now)
  # end
end