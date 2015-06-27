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
      
      def find_by_country_forecast(country, days)
        
          HTTParty.get('http://api.openweathermap.org/data/2.5/weather', :query => {:q => country, :units => 'metric', :cnt => days})
      end
#  puts find_by_country(@country).body #(shows up in the Rails server)
  weather_info = JSON.parse(find_by_country(@country).body)
  @displayString = weather_info["main"]["temp"].to_s + "°C"
    @displayString2 = weather_info["main"]["temp_min"].to_s + "°C"
      @displayString3 = weather_info["main"]["temp_max"].to_s + "°C"
      
      weather_forecast = JSON.parse(find_by_country_forecast(@country, 14).body)
      #puts find_by_country_forecast(@country,14).body
      #@displayForecast =  weather_forcast
      @displayForecast = weather_forecast["main"]["temp"].to_s + "°C"
       @displayForecast2 = weather_forecast["main"]["temp_min"].to_s + "°C"
        @displayForecast3 = weather_forecast["main"]["temp_max"].to_s + "°C"

  end
end
