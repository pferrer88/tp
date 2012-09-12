class CreateTunePlaylists < ActiveRecord::Migration
  def change
    create_table :tune_playlists do |t|
      t.references :tune
      t.references :playlist

      t.timestamps
    end
    add_index :tune_playlists, :tune_id
    add_index :tune_playlists, :playlist_id
  end
end
