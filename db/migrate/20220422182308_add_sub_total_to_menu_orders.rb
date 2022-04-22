class AddSubTotalToMenuOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :menu_orders, :sub_total, :float
  end
end
