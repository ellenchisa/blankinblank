class HomeController < ApplicationController
  def index
    default_cities = ['Boston', 'NYC', 'San Francisco', 'Seattle']
    default_jobs = ['Designer', 'Engineer', 'Product Manager', 'Writer']

    @cities = Document.where(:approved=>true).map(&:city).concat(default_cities).uniq
    @jobs = Document.where(:approved=>true).map(&:job).concat(default_jobs).uniq
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

  def logout
    session[:fbuser] = nil
    redirect_to root_url
  end


end
