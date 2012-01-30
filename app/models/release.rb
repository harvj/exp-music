class Release < ActiveRecord::Base
  validates_presence_of :name, :release_date
  attr_accessible :name, :artist_tokens, :release_date, :album_art, :artists_attributes

  mount_uploader :album_art, AlbumArtUploader

  # Artist Associations
  has_many :album_artists, :dependent => :destroy
  accepts_nested_attributes_for :album_artists
  
  has_many :artists, :through => :album_artists
  accepts_nested_attributes_for :artists, :reject_if => lambda { |a| a[:name].blank? }

  attr_reader :artist_tokens

  def artist_tokens=(ids)
    self.artist_ids = ids.split(',')
  end

  # Recording Associations
  has_many :recordings, :through => :release_tracks
  has_many :release_tracks, :dependent => :destroy
  accepts_nested_attributes_for :recordings, :reject_if => lambda { |r| r[:name].blank? }

end
