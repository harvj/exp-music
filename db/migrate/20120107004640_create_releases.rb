class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.date :release_date
      t.date :recording_date

      t.timestamps
    end
  end
end
