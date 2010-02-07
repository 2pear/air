class CreateAudioFiles < ActiveRecord::Migration
  def self.up
    create_table :audio_files do |t|
      t.string :title
      t.string :author
      t.date :date
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :audio_files
  end
end
