class AddQuantityToMenuOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_orders, :quantity, :integer
  end
end
