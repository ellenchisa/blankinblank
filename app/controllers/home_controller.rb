class HomeController < ApplicationController
  def index
    @cities= Document.all.map(&:city).uniq
    @jobs= Document.all.map(&:job).uniq
  end
end
