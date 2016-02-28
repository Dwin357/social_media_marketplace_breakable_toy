class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :profile_pic_url
      t.text :bio
      t.string :type
      t.string :business_name
      t.string :genere
      t.integer :capacity
      t.string :address

      t.timestamps null: false
    end
  end
end
