class TwittsController
  # before_action :set_message, only: [:index, :post]

  def index
    # appid = ENV['OPEN_WEATHER_FORECAST_KEY']
    collection = { :um => 1, :dois => 2, :tres => 3 }


    debugger
    # message = TinyWeatherForecast::Forecast.new(city, appid)
    #
    render json: collection
  end

  # def twittar
  #
  # end
end
