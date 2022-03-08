class ChangeRatingColumnAtMovie < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :rating, :decimal, :precision => 3, :scale => 1
  end
end
