class AudioFile < ActiveRecord::Base
  has_many :parts
  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :tags
end
