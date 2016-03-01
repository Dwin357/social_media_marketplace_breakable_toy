class Promoter < User
  self.abstract_class=true

  # totally bogus association between two abstract classes
  has_many :social_functions

  
  # def upcoming_events
  #   self.social_functions.where(date >= Time.now)
  # end
end