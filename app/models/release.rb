class Release < ActiveRecord::Base
  validates_presence_of :name, :release_date
  attr_accessible :name, :artist_tokens, :release_date, :album_art, :genre_id,
                  :artists_attributes, :release_tracks_attributes, :recordings_attributes

  mount_uploader :album_art, AlbumArtUploader

  # Genre Association
  belongs_to :genre

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
  accepts_nested_attributes_for :recordings, :reject_if => lambda { |r| r[:name].blank? }
  has_many :release_tracks, :dependent => :destroy
  accepts_nested_attributes_for :release_tracks, :reject_if => lambda { |r| r[:track_no].blank? }
  
  # Model methods

  def length
    sum = 0
    self.recordings.each do |r|
      sum += r.length unless r.length.nil?
    end
    sum
  end

  def length_in_text
    mm, ss = self.length.divmod(60)
    hh, mm = mm.divmod(60)
    if hh > 0
      "%d hour, %d minutes and %d seconds" % [hh, mm, ss]
    else
      "%d minutes, %d seconds" % [mm, ss]
    end
  end
end
