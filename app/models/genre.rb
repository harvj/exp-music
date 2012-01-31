class Genre < ActiveRecord::Base

  has_many :releases

  def to_s
    name
  end

end
