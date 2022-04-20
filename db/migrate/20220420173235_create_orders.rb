class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :email
      t.float :total
      t.integer :status

      t.timestamps
    end
  end
end
