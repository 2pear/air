class CreateAudioFilesPlaylistsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :audio_files_playlists, :id => false do |t|
      t.integer :audio_file_id
      t.integer :playlist_id
    end
  end

  def self.down
    drop_table :audio_files_playlists
  end
end
