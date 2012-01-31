class Recording < ActiveRecord::Base
  validates_presence_of :name

  has_many :releases, :through => :release_tracks
  accepts_nested_attributes_for :releases
  has_many :release_tracks, :dependent => :destroy

  def time
    unless length.nil?
      mm, ss = length.divmod(60)
      if ss < 10
        "%d:0%d" % [mm, ss]
      else
        "%d:%d" % [mm, ss]
      end
    else
      return "--:--"
    end
  end

end
