class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.string :version

      t.timestamps
    end
  end
end
