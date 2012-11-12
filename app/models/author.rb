class Author < ActiveRecord::Base
  attr_accessible :name, :twitter_handle, :email_address, :bio
  has_many :documents
  validates_presence_of :name, :twitter_handle, :email_address, :bio
end
