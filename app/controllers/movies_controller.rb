class MoviesController < ApplicationController

  def new
    if params[:search]
      query = params[:search][:title]
      @movies = Movie.search(query)
      redirect_to movies_path
    else
      @movies = ""
    end
  end

  # def create
  #   @movie = Movie.search(params[:search][:title])
  #   @movie.save
  # end

  def index
    @movies = Movie.search(params[:search][:title])
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :search)
  end
end
