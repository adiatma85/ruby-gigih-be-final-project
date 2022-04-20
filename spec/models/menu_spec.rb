require 'rails_helper'

RSpec.describe Menu, type: :model do
  # Test case where it is valid of Name, Description, and Price
  it 'is valid with a name, description and price' do
    # Some error when using factory bot
    # expect(FactoryBot.build(:menu)).to be_valid
    food = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    expect(food).to be_valid
  end

  # Test case where is is not valid when name attributes is not exist
  it `is invalid without 'name' attribute` do
    food = Menu.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )
    food.valid?
    expect(food.errors[:name]).to include("can't be blank")
  end

  # Test case where is is not valid when description attributes is not exist
  it `is invalid without 'description' attribute` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: nil,
      price: 15000.0
    )
    food.valid?
    expect(food.errors[:description]).to include("can't be blank")
  end

  # Test case where is is not valid when price attributes is not exist
  it `is invalid without 'price' attribute` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: nil
    )
    food.valid?
    expect(food.errors[:price]).to include("can't be blank")
  end

  # Test case where is is not valid when price attributes is non-numerical
  it `is invalid when 'price' attribute is non-numerical` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: "non-numerical value"
    )
    food.valid?
    expect(food.errors[:price]).to include("is not a number")
  end

  # Test case where is is not valid when price attributes is >= 0.01
  it `is valid when 'price' attribute >= 0.01` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
    )
    expect(food).to be_valid
  end

  # Test case where is is not valid when price attributes is < 0.01
  it `is invalid when 'price' attribute < 0.01` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 0.005
    )
    food.valid?
    expect(food.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  # Test case where the lenght of description is not exceeded 150 characters
  it `is invalid when 'description' attribute exceeded than 150 character` do
    food = Menu.new(
      name: 'Nasi Uduk',
      description: ' Nasi uduk merupakan kreasi nasi putih yang sudah diberi bumbu sehingga menghasilkan cita rasa yang gurih. 
                    Tekstur dari nasi uduk juga tidak lengket dan pulen. Cocok dinikmati kapan saja dengan beragam lauk pauk.
                    Menu masakan yang nikmat ini ternyata hasil dari persilangan dua budaya yaitu budaya Melayu dan Jawa.',
      price: 15000.0
    )
    food.valid?
    expect(food.errors[:description]).to include("too long")
  end

  # Test case where to test the name attrribute for each row is guaranted for unique
  it 'is invalid with a duplicate name' do
    food1 = Menu.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    food2 = Menu.new(
      name: 'Nasi Uduk',
      description: 'Just with different description',
      price: 15000.0
    )

    food2.valid?
    expect(food2.errors[:name]).to include("has already been taken")
  end
end
