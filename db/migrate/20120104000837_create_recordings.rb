class CreateRecordings < ActiveRecord::Migration
  def change
    create_table :recordings do |t|
      t.string :name
      t.integer :length

      t.timestamps
    end
  end
end
