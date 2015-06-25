class MainPagesController < ApplicationController
  
  require 'open_weather'

  def home
  end

  def list_results
  @country = params[:country]
  @start_date_year = params[:start_date]
  #@client = YahooWeather::Client.new
  #response = @client.lookup_by_woeid(2488892)
  #puts "TEST: "+response.title
  @displayString = OpenWeather::Current.city(@country)
  
  #@testWeather = response.page_url
  #write application logic here
  end
end
