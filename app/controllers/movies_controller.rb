class MoviesController < ApplicationController

  def new
    if params[:passed_parameter]
      list_id = params[:passed_parameter][:list_id]
    else
      list_id = params[:search][:list_id]
    end
    @list = List.find(list_id)
    if params[:search]
      query = params[:search][:title]
      @movies = Movie.search(query)
      redirect_to movies_path(passed_parameter: {query: params[:search][:title], list: list_id})
    else
      @movies = ""
    end
  end

  def index
    list_id = params[:passed_parameter][:list]
    @list = List.find(list_id)
    query = params[:passed_parameter][:query].gsub(/[[:punct:]]/, '%')
    @movies = Movie.where("lower(replace(title, '-', '')) LIKE lower(?)", "%#{query}%").order('popularity DESC')
  end

  private
  def movie_params
    params.require(:movie).permit(:id, :title, :overview, :poster_url, :rating, :search)
  end
end
