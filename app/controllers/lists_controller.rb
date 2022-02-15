class ListsController < ApplicationController
  def index
    @user = current_user
    @lists = List.where(user_id: @user)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
  end

  def new
    @user = current_user
    @list = List.new
  end

  def create
    @user = current_user
    @list = List.new(list_params)
    @list.user = @user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.bookmarks.empty?
      @list.destroy
      redirect_to lists_path
    else
      redirect_to list_path(@list)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :image)
  end
end
