# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  album_id    :integer          not null
#  title       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  bonus_track :boolean
#  lyrics      :text
#

class Song < ActiveRecord::Base
  validates :album_id, :title, presence: true

  belongs_to :album

  has_many :notes, :dependent => :destroy

  delegate :band, to: :album
end
