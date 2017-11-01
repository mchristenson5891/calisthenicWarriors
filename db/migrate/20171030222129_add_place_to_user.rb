class AddPlaceToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :places, foreign_key: true
  end
end
