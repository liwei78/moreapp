class Email < ActiveRecord::Base
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :address, 
    :presence   => true,
    :format     => { :with => email_regex}, 
    :uniqueness => true

end
