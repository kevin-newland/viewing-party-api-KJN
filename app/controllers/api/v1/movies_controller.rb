class Api::V1::MoviesController < ApplicationController

  def index
    conn = Faraday.new(url: "https://api.themoviedb.org" ) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end
    
    response = conn.get("/3/movie/top_rated", { page: params[:page]})
    json = JSON.parse(response.body, symbolize_names: true)

    render json: json
  end
end