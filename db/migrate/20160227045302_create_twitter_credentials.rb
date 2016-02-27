class CreateTwitterCredentials < ActiveRecord::Migration
  def change
    create_table :twitter_credentials do |t|
      t.integer :user_id, index: true
      t.string :uid, index: true
      t.string :auth_token
      t.string :auth_secret
    end
  end
end
