class TwittsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def twittar
    appid = ENV['OPEN_WEATHER_FORECAST_KEY']
    geocoder_key = ENV['GEOCODER_KEY']

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_KEY_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      config.bearer_token        = ENV['TWITTER_BEARER_TOKEN']
    end

    message = TinyWeatherForecast::Forecast.new(params[:city], appid, geocoder_key).forecast

    client.update(message)

    render json: message
  end
end
