class AddRecordingDateToRecordings < ActiveRecord::Migration
  def up
    add_column :recordings, :recording_date, :date
    remove_column :releases, :recording_date
  end

  def down
    remove_column :recordings, :recording_date
    add_column :releases, :recording_date, :date
  end
end
