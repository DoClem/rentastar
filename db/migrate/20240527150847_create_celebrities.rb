class CreateCelebrities < ActiveRecord::Migration[7.1]
  def change
    create_table :celebrities do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
