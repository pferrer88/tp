class CreateTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.references :user
      t.references :artist
      t.references :album
      t.string :remote_id
      t.string :name
      t.text :description
      t.string :status
      t.integer :year
      t.integer :time

      t.timestamps
    end
    add_index :tunes, :user_id
    add_index :tunes, :artist_id
    add_index :tunes, :album_id
  end
end
