require "rails_helper"

RSpec.describe "Movies API", type: :request do
  it "can retrieve top-rated movies " do
    get "/api/v1/movies/top_rated"

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)[:data]
    
    results.each do |movie|
      expect(movie[:id].to_i).to be_a(Integer)
      expect(movie[:type]).to be_a(String)
      expect(movie[:attributes]).to have_key(:title)
      expect(movie[:attributes]).to have_key(:vote_average)
    end
  end

  it "retrieve movies from The Movie DB API based on a search query from the request" do
    get "/api/v1/movies?search=Lord of the Rings" 

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    results.each do |movie|
      expect(movie[:id].to_i).to be_a(Integer)
      expect(movie[:type]).to be_a(String)
      expect(movie[:attributes]).to have_key(:title)
      expect(movie[:attributes]).to have_key(:vote_average)
    end
  end
end