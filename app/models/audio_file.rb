class AudioFile < ActiveRecord::Base
  has_many :parts
  has_and_belongs_to_many :playlists
end
