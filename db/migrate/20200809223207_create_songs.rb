class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :artist_name
      t.integer :release_year
      t.boolean :released
      t.string :title
      t.string :genre
      t.integer :year

      t.timestamps
    end
  end
end
