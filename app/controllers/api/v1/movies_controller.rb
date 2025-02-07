class Api::V1::MoviesController < ApplicationController
  def index
    conn = Faraday.New(url: "https://api.themoviedb.org" ) do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.tmdb[:key]
    end

    response = conn.get("/3/movie/top_rated", {total_results: num_of_results})
    json = JSON.parse(response.body, symbolize_names: true)

    
  end
end