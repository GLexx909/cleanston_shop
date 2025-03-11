class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :count, null: false, default: 0
      t.integer :price, null: false, default: 0
      t.timestamps
    end

    add_index :products, :name, unique: true
    add_index :products, :price, unique: true
  end
end
