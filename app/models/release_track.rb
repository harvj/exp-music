class ReleaseTrack < ActiveRecord::Base

  belongs_to :release
  
  belongs_to :recording
  accepts_nested_attributes_for :recording

end
