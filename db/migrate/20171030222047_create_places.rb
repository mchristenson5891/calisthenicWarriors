class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :location
      t.attachment :photo
      t.string :equipment
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
