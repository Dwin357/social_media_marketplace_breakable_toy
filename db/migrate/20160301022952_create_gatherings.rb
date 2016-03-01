class CreateGatherings < ActiveRecord::Migration
  def change
    create_table :gatherings do |t|
      t.string :name
      t.integer :artist_id, index: true
      t.text :description
    end
  end
end
