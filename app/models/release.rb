class Release < ActiveRecord::Base
  validates_presence_of :name
  attr_accessible :name, :artist_tokens, :release_date

  # Artist Associations
  has_many :artists, :through => :album_artists
  has_many :album_artists, :dependent => :destroy

  attr_reader :artist_tokens

  def artist_tokens=(ids)
    self.artist_ids = ids.split(',')
  end

  # Recording Associations
  has_many :recordings, :through => :release_tracks
  has_many :release_tracks, :dependent => :destroy
  accepts_nested_attributes_for :recordings, :reject_if => lambda { |r| r[:name].blank? }

end
