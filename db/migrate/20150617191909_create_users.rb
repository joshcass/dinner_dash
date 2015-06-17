class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.integer :role

      t.timestamps null: false
    end
  end
end
