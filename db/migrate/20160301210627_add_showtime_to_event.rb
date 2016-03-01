class AddShowtimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :showtime, :timestamp
  end
end
