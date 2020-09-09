class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :level, default:1
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, deault: false
      t.timestamp
    end
  end
end
