class Artist < ActiveRecord::Base
  validates_presence_of :name

  has_many :releases, :through => :album_artists
  has_many :album_artists, :dependent => :destroy

end
