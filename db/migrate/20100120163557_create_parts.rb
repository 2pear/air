class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :filename
      t.integer :partnumber
      t.integer :audio_file_id

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
