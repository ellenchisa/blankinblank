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
  
  def oauth
    oauth = Koala::Facebook::OAuth.new(oauth_url)
    
    access_token = oauth.get_access_token(params[:code])
    
    graph= Koala::Facebook::API.new(access_token)
    fb_user= graph.get_object('me')
    
    session[:fbuser] = fb_user
    
    redirect_to new_document_url
  end
    
end
