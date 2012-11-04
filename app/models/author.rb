class Author < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :documents
end
