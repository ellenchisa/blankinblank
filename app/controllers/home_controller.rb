class HomeController < ApplicationController
  def index
    @cities= Document.all.map(&:city).uniq
    @jobs= Document.all.map(&:job).uniq
  end
  
  def results
    @city = params[:cities]
    @job = params[:jobs]
    @documents = Document.where(:city => @city, :job => @job)
  end
  
    
end
