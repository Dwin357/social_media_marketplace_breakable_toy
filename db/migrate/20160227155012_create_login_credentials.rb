class CreateLoginCredentials < ActiveRecord::Migration
  def change
    create_table :login_credentials do |t|
      t.integer :user_id, index: true
      t.string :password_hash

      t.timestamps null: false
    end
  end
end
