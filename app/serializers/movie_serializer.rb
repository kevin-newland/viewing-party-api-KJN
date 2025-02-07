class MovieSerializer
  
  def self.format_movie_list(movies)
    { 
      data: movies.map do |movie|
        {
          id: movie[:id].to_s,
          type: "movie",
          attributes: {
            title: movie[:title],
            vote_average: movie[:vote_average]
          }
        }
      end
    }
  end
end