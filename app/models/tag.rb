class Tag < ActiveRecord::Base
  has_and_belongs_to_many :audio_files

  validates_presence_of :name
end
