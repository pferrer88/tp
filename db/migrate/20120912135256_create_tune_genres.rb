class CreateTuneGenres < ActiveRecord::Migration
  def change
    create_table :tune_genres do |t|
      t.references :tune
      t.references :genre

      t.timestamps
    end
    add_index :tune_genres, :tune_id
    add_index :tune_genres, :genre_id
  end
end
