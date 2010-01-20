class User < ActiveRecord::Base
  has_many :playlists, :class_name => "Playlist"
  has_many :audio_files, :class_name => "AudioFile"
end
