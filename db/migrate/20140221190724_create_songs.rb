class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :album_id, null: false
      t.string :title, null: false

      t.timestamps
    end

    add_index :songs, :album_id
    add_index :songs, :title
  end
end
