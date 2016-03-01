class SocialFunction < ActiveRecord::Base
  self.abstract_class=true

  # totally bogus association between abstract classes
  belongs_to :promoter
end