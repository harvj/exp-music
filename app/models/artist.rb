class Artist < ActiveRecord::Base
  validates_presence_of :name

  has_many :releases, :through => :album_artists
  accepts_nested_attributes_for :releases


  has_many :album_artists, :dependent => :destroy

end
