class PlacesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :places_users, :id => false do |t|
      t.integer :place_id
      t.integer :user_id
    end
  end
end
