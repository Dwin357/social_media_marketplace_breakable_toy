class CreateUserCredentials < ActiveRecord::Migration
  def change
    create_table :user_credentials do |t|
      t.integer :user_id
      t.integer :uid
      t.string :authenticator

      t.timestamps null: false
    end
  end
end
