require 'rails_helper'

RSpec.describe Menu, type: :model do
  # Test case where it is valid of Name, Description, and Price
  it 'is valid with a name, description and price' do
    # Some error when using factory bot
    # expect(FactoryBot.build(:menu)).to be_valid
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    expect(menu).to be_valid
  end

  # Test case where is is not valid when name attributes is not exist
  it `is invalid without 'name' attribute` do
    menu = Menu.new(
      name: nil,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )
    menu.valid?
    expect(menu.errors[:name]).to include("can't be blank")
  end

  # Test case where is is not valid when description attributes is not exist
  it `is invalid without 'description' attribute` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: nil,
      price: 15000.0
    )
    menu.valid?
    expect(menu.errors[:description]).to include("can't be blank")
  end

  # Test case where is is not valid when price attributes is not exist
  it `is invalid without 'price' attribute` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: nil
    )
    menu.valid?
    expect(menu.errors[:price]).to include("can't be blank")
  end

  # Test case where is is not valid when price attributes is non-numerical
  it `is invalid when 'price' attribute is non-numerical` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: "non-numerical value"
    )
    menu.valid?
    expect(menu.errors[:price]).to include("is not a number")
  end

  # Test case where is is not valid when price attributes is >= 0.01
  it `is valid when 'price' attribute >= 0.01` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 10000.0
    )
    expect(menu).to be_valid
  end

  # Test case where is is not valid when price attributes is < 0.01
  it `is invalid when 'price' attribute < 0.01` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 0.005
    )
    menu.valid?
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  # Test case where length of description is EXACTLY at 150 character
  it `is valid when 'description' attribute exactly at 150 character` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: '1wH5PBGWEB3sf4UEV0h7dwijwuSrc7GjDTM1IKbzREyuu7wLgvoJZp8tqFtBHOC85SDLFkmNER9IcLD4KNDr7UlrAghPq7FfnLXSnnvquMLx902QwlqEmO4t9scQH9jSxhJtk35qBVUbjvURcD8i04',
      price: 15000.0
    )
    menu.valid?
    expect(menu).to be_valid
  end

  # Test case where the length of description is not exceeded 150 characters
  it `is invalid when 'description' attribute exceeded than 150 character` do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: ' Nasi uduk merupakan kreasi nasi putih yang sudah diberi bumbu sehingga menghasilkan cita rasa yang gurih. 
                    Tekstur dari nasi uduk juga tidak lengket dan pulen. Cocok dinikmati kapan saja dengan beragam lauk pauk.
                    Menu masakan yang nikmat ini ternyata hasil dari persilangan dua budaya yaitu budaya Melayu dan Jawa.',
      price: 15000.0
    )
    menu.valid?
    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  # Test case where to test the name attrribute for each row is guaranted for unique
  it 'is invalid with a duplicate name' do
    menu1 = Menu.create(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 15000.0
    )

    menu2 = Menu.new(
      name: 'Nasi Uduk',
      description: 'Just with different description',
      price: 15000.0
    )

    menu2.valid?
    expect(menu2.errors[:name]).to include("has already been taken")
  end
end
