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
      name: nil,
    )
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end

  # Test case where to test the name attrribute for each row is guaranted for unique
  it 'is invalid with a duplicate name' do
    category1 = Category.create(
      name: 'Italian',
    )

    category2 = Category.new(
      name: 'Italian',
    )

    category2.valid?
    expect(category2.errors[:name]).to include("has already been taken")
  end
end
