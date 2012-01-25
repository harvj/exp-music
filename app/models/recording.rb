class Recording < ActiveRecord::Base
  validates_presence_of :name

  has_many :releases, :through => :release_tracks
  has_many :release_tracks, :dependent => :destroy

end
