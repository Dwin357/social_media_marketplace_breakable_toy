class DropTableUserCredentials < ActiveRecord::Migration
  def change
    drop_table :user_credentials
  end
end
