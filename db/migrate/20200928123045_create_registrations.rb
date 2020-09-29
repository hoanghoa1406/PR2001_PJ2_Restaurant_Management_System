class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.string :full_name
      t.string :company
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
