class Release < ActiveRecord::Base
  validates_presence_of :name

  has_many :artists, :through => :album_artists
  has_many :album_artists, :dependent => :destroy

  has_many :recordings, :through => :release_tracks
  has_many :release_tracks, :dependent => :destroy

  accepts_nested_attributes_for :artists, :reject_if => lambda { |a| a[:name].blank? }
  accepts_nested_attributes_for :recordings, :reject_if => lambda { |r| r[:name].blank? }

end
