class RenameProductCountToQuantity < ActiveRecord::Migration[8.0]
  def change
    rename_column :products, :count, :quantity
  end
end
