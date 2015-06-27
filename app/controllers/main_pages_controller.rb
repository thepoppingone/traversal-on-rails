class MainPagesController < ApplicationController

  require 'open_weather'

  def home
  end

  def list_results
  @country = params[:country]
  @start_date_year = params[:start_date]
  
  #@displayString = OpenWeather::Current.city(@country) Using openweather gem
  
      def find_by_country(country) #returns as a JSON
         #use HTTP to call random APIs using a query string
          HTTParty.get('http://api.openweathermap.org/data/2.5/weather', :query => {:q => country, :units => 'metric'})
      end
  # puts find_by_country(@country).body (shows up in the Rails server)
  weatherinfo = JSON.parse(find_by_country(@country).body)
  @displayString = weatherinfo["main"]["temp"]
    @displayString2 = weatherinfo["main"]["temp_min"]
      @displayString3 = weatherinfo["main"]["temp_max"]

  end
end
