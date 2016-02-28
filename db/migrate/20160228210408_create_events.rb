class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :venue_id, index: true
      t.string :name
      t.integer :ticket_price
      t.integer :ticket_max

      t.timestamps null: false
    end
  end
end
