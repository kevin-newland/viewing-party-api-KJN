class Api::V1::MoviesController < ApplicationController

  def index
    movies = MovieGateway.get_top_rated
    render json: MovieSerializer.format_movie_list(movies)
  end
end