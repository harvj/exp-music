require 'rbrainz'
include MusicBrainz

title = ARGV[0].dup.force_encoding("UTF-8")
artist = ARGV[1].dup.force_encoding("UTF-8")

q = Webservice::Query.new

release_includes = Webservice::ReleaseIncludes.new(
  :artist => true,
  :counts => true,
  :release_groups => true,
  :tracks => true,
  :release_rels => true
)

results = q.get_releases(Webservice::ReleaseFilter.new(:title => title, :artist => artist))

puts results[0].entity.earliest_release_date
puts results[0].entity.tracks[0].title


