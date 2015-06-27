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

  #response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=Singapore&units=metric')
  #puts response.body
  #@displayString = JSON.parse(response.body)

  #displayString = OpenWeather::Current.city(@country)
  
  #testing
  #@displayString = JSON.parse(response.body)
  
  #@testWeather = response.page_url
  #write application logic here

  def find_by_country(country)
   HTTParty.get('http://api.openweathermap.org/data/2.5/weather', :query => {:q => country, :units => 'metric'})
  end
  puts find_by_country(@country).body
  #@displayString = find_by_country(@country).body
  weatherinfo = JSON.parse(find_by_country(@country).body)
  @displayString = weatherinfo["main"]["temp"]
    @displayString2 = weatherinfo["main"]["temp_min"]
      @displayString3 = weatherinfo["main"]["temp_max"]



  end
end
