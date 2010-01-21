class CreateAudioFilesTagsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :audio_files_tags, :id => false do |t|
      t.integer :audio_file_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :audio_files_tags
  end
end
