class AddPopularityToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :popularity, :integer
  end
end
