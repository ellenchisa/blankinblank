class Author < ActiveRecord::Base
  attr_accessible :name, :twitterhandle, :email_address
  has_many :documents
end
