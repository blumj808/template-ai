class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :dog_id
      t.string :description
      t.string :image
      t.integer :dogs_count

      t.timestamps
    end
  end
end
