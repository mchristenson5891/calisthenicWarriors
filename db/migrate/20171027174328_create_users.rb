class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.attachment :photo
      t.string :email
      t.text :description


      t.timestamps
    end
  end
end
