class Document < ActiveRecord::Base
  
  attr_accessible :url, :city, :job, :approved, :title
  belongs_to :author 
  default_scope :include => :author
  validates_presence_of :url, :city, :job, :author, :title
  
end
