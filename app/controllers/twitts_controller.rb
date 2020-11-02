class TwittsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # debugger
    # appid = ENV['OPEN_WEATHER_FORECAST_KEY']
    message = TinyWeatherForecast::Forecast.new(params[:city]).forecast

    render json: message
  end

  def twittar
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_KEY_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      config.bearer_token        = ENV['TWITTER_BEARER_TOKEN']
    end

    message = TinyWeatherForecast::Forecast.new(params[:city]).forecast

    debugger
    client.update(message)

    render json: message
  end
end
