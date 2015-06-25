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

  response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=Singapore&units=metric')
  puts response.body
  #displayString = OpenWeather::Current.city(@country)
  @displayString = JSON.parse(response.body)
  #@testWeather = response.page_url
  #write application logic here
  end
end
