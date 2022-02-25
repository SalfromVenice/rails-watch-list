class MoviesController < ApplicationController

  def new
    if params[:search]
      query = params[:search][:title]
      @movies = Movie.search(query)
      redirect_to movies_path(passed_parameter: params[:search][:title])
    else
      @movies = ""
    end
  end

  def index
    query = params[:passed_parameter].gsub(/[[:punct:]]/, '%')
    @movies = Movie.where("lower(title) LIKE lower(?)", "%#{query}%")
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating, :search)
  end
end
