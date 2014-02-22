class ChangeNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :track_id
    add_column :notes, :song_id, :integer
    add_index :notes, :song_id
  end
end
