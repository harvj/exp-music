class ReleaseTrack < ActiveRecord::Base

  belongs_to :release
  belongs_to :recording

end
