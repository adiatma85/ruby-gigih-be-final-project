require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  # It will connect between Menu and Category
  it `should connect between 'Menu' model and 'Category' model` do
    menu = Menu.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )
    category = Category.create(
      name: 'Indonesian',
    )
    menu_category = MenuCategory.new(
      menu_id: menu.id,
      category_id: category.id,
    )
    expect(menu_category).to be_valid
  end
end
