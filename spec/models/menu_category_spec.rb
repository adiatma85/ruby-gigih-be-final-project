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
    menu_category = category.menu_categories.create(:menu => menu)
    expect(menu).to be_valid
    expect(category).to be_valid
    expect(menu_category).to be_valid
    expect(menu_category.category_id).to eq(category.id)
    expect(menu_category.menu_id).to eq(menu.id)
  end
end
