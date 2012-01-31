class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string  :name
      t.timestamps
    end

    add_column :releases, :genre_id, :integer
    add_index  :releases, :genre_id
  end
end
