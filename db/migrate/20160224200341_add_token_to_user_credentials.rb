class AddTokenToUserCredentials < ActiveRecord::Migration
  def change
    add_column :user_credentials, :token, :string
  end
end
