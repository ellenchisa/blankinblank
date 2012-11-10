class HomeController < ApplicationController
  def index
    @cities = Document.where(:approved=>true).map(&:city).uniq
    @jobs = Document.where(:approved=>true).map(&:job).uniq
  end
  
  def results
    @city = params[:cities]
    @job = params[:jobs]
    @documents = Document.where(:city => @city, :job => @job, :approved => true)
  end
  
    
end
