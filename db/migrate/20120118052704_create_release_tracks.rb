class CreateReleaseTracks < ActiveRecord::Migration
  def change
    create_table :release_tracks do |t|
      t.integer :track_no
      t.integer :release_id
      t.integer :recording_id
      t.timestamps
    end

    add_index :release_tracks, :release_id
    add_index :release_tracks, :recording_id
  end
end
