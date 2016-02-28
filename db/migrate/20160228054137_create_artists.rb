class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :profile_pic_url
      t.text :bio
      t.string :type
      t.string :genere
      t.string :business_name

      t.timestamps null: false
    end
  end
end
