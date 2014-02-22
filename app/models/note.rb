# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  created_at :datetime
#  updated_at :datetime
#  song_id    :integer
#

class Note < ActiveRecord::Base
  validates :user_id, :song_id, :body, presence: true

  belongs_to :user

  belongs_to :song
end
