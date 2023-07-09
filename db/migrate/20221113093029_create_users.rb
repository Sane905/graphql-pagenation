class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.string :uid, null: false, primary_key: true
      t.string :email, null: false
      t.string :password_digest, null: false


      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
