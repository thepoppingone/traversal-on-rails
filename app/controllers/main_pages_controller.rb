class MainPagesController < ApplicationController
  autocomplete :city, :name

  require 'open_weather'
  @team_page = false

  def home
    @html_title = "Traversal - Home"
  end
  
  def city_search
    @cities = City.search(params[:city]) 
  
  end

  def list_results
    @html_title = "Traversal - Results"

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

      def get_lat_long_by_city_name(city)
        Geocoder.coordinates(city)
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
    
      @lat_long = get_lat_long_by_city_name(@city)

      currentTemp = weather_info["main"]["temp"].to_f
      if currentTemp > '25.4'.to_f
        @season = 'Summer'.to_s
      elsif currentTemp < '14.4'.to_f
        @season = 'Winter'.to_s
      elsif currentTemp > '14.4'.to_f and currentTemp < '18.2'.to_f
        @season = 'Spring'.to_s
      else
        @season = 'Autumn'.to_s
      end
      
      #@season = @season.downcase
      
      @itemList = Item.where(:season => @season).pluck(:name)

      def find_image_by_city(city) #returns as a JSON
         #use HTTP to call random APIs using a query string
          HTTParty.get('https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=df3839f752aa839b3ea7e167b6f7394b&safe_search=1&per_page=10&page=1&format=json&nojsoncallback=1&tag_mode=AND', :query => {:tags => "#{city}&landscape"})
      end
      cityImage = JSON.parse(find_image_by_city(@city).body)
      @id = cityImage["photos"]["photo"].first["id"]
      @farmId = cityImage["photos"]["photo"].first["farm"]
      @secretId = cityImage["photos"]["photo"].first["secret"]
      @serverId = cityImage["photos"]["photo"].first["server"]

      @num_of_days = 13
  end

  def about_us
      @html_title = "Traversal Team"
      @team_page = true
  end

  def contact_us
      @html_title = "Traversal Contact Us"
      @team_page = true
  end






end
