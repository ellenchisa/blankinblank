class Author < ActiveRecord::Base
  attr_accessible :name, :twitter_handle, :email_address
  has_many :documents
end
