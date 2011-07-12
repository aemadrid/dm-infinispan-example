require 'sinatra'
require 'haml'

module Beers
  class Application < Sinatra::Base
            
    get '/' do 
      haml :index
    end

    get '/beers' do
      @beers = Beer.all
      haml :beers
    end

    post '/beers' do
      @beers = Beer.all :desc.like => "%#{params[:q]}%", :name.like => "%#{params[:q]}%"
      haml :beers
    end

    get '/beer/:id' do
      @beer = Beer.first :id => params[:id]
      haml :beer
    end

  end
end