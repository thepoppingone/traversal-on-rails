class MainPagesController < ApplicationController

  require 'open_weather'

  def home
  end

  def list_results
  @city = params[:city]
  @start_date_year = params[:start_date]

  #@displayString = OpenWeather::Current.city(@city) Using openweather gem

      def find_by_city(city) #returns as a JSON
         #use HTTP to call random APIs using a query string
          HTTParty.get('http://api.openweathermap.org/data/2.5/weather', :query => {:q => city, :units => 'metric'})
      end

      def find_by_city_forecast(city, days)
          HTTParty.get('http://api.openweathermap.org/data/2.5/forecast', :query => {:q => city, :units => 'metric', :cnt => days})
      end
#  puts find_by_city(@city).body #(shows up in the Rails server)
  weather_info = JSON.parse(find_by_city(@city).body)
  @displayString = weather_info["main"]["temp"].to_s + "°C"
    @displayString2 = weather_info["main"]["temp_min"].to_s + "°C"
      @displayString3 = weather_info["main"]["temp_max"].to_s + "°C"

      weather_forecast = JSON.parse(find_by_city_forecast(@city, 14).body)
      #puts find_by_city_forecast(@city,14).body
      #@displayForecast =  weather_forcast
      @displayForecastHash = weather_forecast["list"] #+ "°C"
      @displayForecastArray = []
      @displayForecastHash.each do |w|
        puts w["main"]
        @displayForecastArray.push w["main"]["temp"]
      end

      currentTemp = weather_info["main"]["temp"].to_f
      if currentTemp > '25.4'.to_f
        @testString = 'Summer HOTTTTTTTTTTTTTTTTTTTTTTT'.to_s
      elsif currentTemp < '14.4'.to_f
        @testString = 'Winter Do you want to build a snowman?'.to_s
      elsif currentTemp > '14.4'.to_f and currentTemp < '18.2'.to_f
        @testString = 'Spring its time for cny'.to_s
      else
        @testString = 'Autumn awww the sakura'.to_s
      end
      # @displayForecast2 = weather_forecast["main"]["temp_min"].to_s + "°C"
      #  @displayForecast3 = weather_forecast["main"]["temp_max"].to_s + "°C"

  end
end
