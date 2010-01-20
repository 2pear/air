require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :playlists
  has_many :audio_files

  validates_length_of :login, :within => 6..40
  validates_length_of :password, :within => 6..40
  validates_presence_of :login, :email, :password, :password_confirmation
  validates_uniqueness_of :login, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => RFC822::EmailAddress, :message => "Invalid email"

  attr_protected :id
  attr_accessor :password, :password_confirmation

  def self.authenticate(login, pass)
    u = User.find(:first, :conditions => { :login => login })
    if u.nil? or User.encrypt(pass, u.getsalt) != u.gethash
      nil
    else
      u
    end
  end

  def password=(newpass)
    @password = newpass  # save for validation shits
    salt = getsalt || ActiveSupport::SecureRandom.base64(32)
    pass = User.dohash(newpass, salt) + salt
  end

  protected

  HASH_LENGTH = Digest::SHA256.new.hexdigest.length

  def gethash
    pass? ? pass[0..HASH_LENGTH] : nil
  end

  def getsalt
    pass? ? pass[HASH_LENGTH..-1] : nil
  end

  ROUNDS = 64

  def self.dohash(pass, salt)
    digest = Digest::SHA256.new
    digest << pass
    hash = nil
    ROUNDS.times do
      digest << salt
      hash = digest.hexdigest
      digest.reset
      digest << hash
    end
    hash
  end
end
