class AddTotalToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_price, :decimal
  end
end
