class AddShowtimeToGathering < ActiveRecord::Migration
  def change
    add_column :gatherings, :showtime, :timestamp
  end
end
