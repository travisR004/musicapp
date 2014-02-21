# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  album_name :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base
  validates :band_id, :album_name, presence: true

  belongs_to :band

  has_many :songs, dependent: :destroy
end
