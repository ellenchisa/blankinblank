class Document < ActiveRecord::Base
  
  attr_accessible :url, :city, :job, :approved
  belongs_to :author
  validates_presence_of :url, :city, :job, :author
  
end
