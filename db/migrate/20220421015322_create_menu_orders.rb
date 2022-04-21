class CreateMenuOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_orders do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
