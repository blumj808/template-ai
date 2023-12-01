class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.integer :pet_id
      t.string :bio
      t.string :age
      t.string :gender
      t.integer :dogs_count

      t.timestamps
    end
  end
end
