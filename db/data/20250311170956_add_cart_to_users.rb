# frozen_string_literal: true

class AddCartToUsers < ActiveRecord::Migration[8.0]
  BATCH_SIZE = 1000

  def up
    User.in_batches(of: BATCH_SIZE) do |batch|
      carts_data = batch.ids.map { { user_id: it } }
      Cart.insert_all(carts_data)
    end
  end

  def down
    Cart.delete_all
  end
end
