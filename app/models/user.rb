class User < ActiveRecord::Base
  has_many :credentials, class_name: "UserCredential"


  

end
