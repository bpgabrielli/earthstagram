class CreateEarths < ActiveRecord::Migration
  def change
    create_table :earths do |t|
      t.text :full_name
      t.text :profile_picture
      t.text :username
      t.text :text
      t.text :filter
      t.text :image
      t.text :thumbnail
      t.text :link
      t.text :location
      t.text :type
      t.text :ig_id
      t.text :ig_created_time
      t.text :latitude
      t.text :longitude

      t.timestamps
    end
  end
end
