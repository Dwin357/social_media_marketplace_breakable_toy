class RenameUsersTablePatrons < ActiveRecord::Migration
  def change
    rename_table :users, :patrons
  end
end
