class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.string :bio
      t.integer :shelter_id
      t.string :gender
      t.integer :owner_id
      t.string :picture
      t.string :status

      t.timestamps
    end
  end
end
