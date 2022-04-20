require 'rails_helper'

RSpec.describe Category, type: :model do
  # Test case where it is valid because 'Name' attribute is fulfilled
  it 'is valid with when name attribute is fulfilled' do
    category = Category.new(
      name: 'Indonesian',
    )
    expect(category).to be_valid
  end

  # Test case where is invalid because 'Name' attribute is nil
  it `is invalid without 'name' attribute` do
    category = Category.new(
      name: 'Indonesian',
    )
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
end
