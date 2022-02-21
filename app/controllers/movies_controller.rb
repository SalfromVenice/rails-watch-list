class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.search(query)
    @movie.save
  end

  # private
  # def movie_params
  #   params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  # end
end
