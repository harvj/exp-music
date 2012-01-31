# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Artist.destroy_all
Release.destroy_all
Recording.destroy_all
ReleaseTrack.destroy_all
Genre.destroy_all

CSV.foreach("#{Rails.root}/db/output.csv") do |row|
  @given_name = row[0]
  @given_artist = row[1]
  @given_album = row[2]
  @given_genre = row[3]
  @given_length = row[4]
  @given_no = row[5]
  @given_date = row[6]

  unless @genre = Genre.find_by_name(@given_genre)
    @genre = Genre.create!(:name => @given_genre)
  end

  unless @artist = Artist.find_by_name(@given_artist)
    @artist = Artist.create!(:name => @given_artist)
  end

  unless(@release = Release.find_by_name(@given_album) && @release.artists[0] == @artist)
    @release = Release.create!(:name => @given_album)
  else
    @release = Release.find_by_name(@given_album)
  end

  @release.artists << @artist
  @release.update_attributes(:genre_id => @genre.id, :release_date => @given_date)

  @recording = Recording.create!(:name => @given_name, :length => @given_length.to_i)
  @release.recordings << @recording

  @tracks = ReleaseTrack.where(:recording_id => @recording.id, :release_id => @release.id)
  @tracks[0].update_attributes(:track_no => @given_no.to_i)

end