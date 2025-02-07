class Api::V1::MoviesController < ApplicationController
  def index
    conn = Faraday.New(url: "https://api.themoviedb.org" ) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("")
  end
end