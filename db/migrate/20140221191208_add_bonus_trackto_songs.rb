class AddBonusTracktoSongs < ActiveRecord::Migration
  def change
    add_column :songs, :bonus_track, :boolean
  end
end
