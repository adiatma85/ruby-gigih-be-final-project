require 'rails_helper'

RSpec.describe MenuOrder, type: :model do
  # It will connect between Menu and Order
  it `should connect between 'Menu' model and 'Order' model` do
    menu = Menu.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )
    order = Order.create(
      email: 'some_example@gmail.com',
    )
    menu_order = order.menu_orders.create(:menu => menu)
    expect(menu_order).to be_valid
    expect(menu_order.order_id).to eq(order.id)
    expect(menu_order.menu_id).to eq(menu.id)
  end
end
