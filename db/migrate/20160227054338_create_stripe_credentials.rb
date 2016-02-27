class CreateStripeCredentials < ActiveRecord::Migration
  def change
    create_table :stripe_credentials do |t|
      t.integer :user_id, index: true
      t.string :uid, index: true
      t.string :auth_token
      t.string :auth_secret
      t.string :currency
      t.string :account_type
      t.string :account_status

      t.timestamps null: false
    end
  end
end
