class Document < ActiveRecord::Base
  
  attr_accessible :url, :city, :job
  belongs_to :author
  
end
