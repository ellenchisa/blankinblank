class Author < ActiveRecord::Base
  attr_accessible :twitter_handle, :email_address, :bio
  has_many :documents
  validates_presence_of :name, :facebookuid, :email_address, :bio, :twitter_handle
end
