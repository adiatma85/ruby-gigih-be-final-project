require 'rails_helper'

RSpec.describe Order, type: :model do
  # It should valid when only 'email' attribute is created
  # Furthermore, the status will be 'NEW' and 'Total' Attribute is 0
  it `should valid when only 'email' is inserted` do
    order = Order.new(
      email: 'adiatma85@gmail.com',
    )
    expect(order).to be_valid
    expect(order.total).to eq(0)
    expect(order.status_new?).to eq(Time.current.hour < 17 ? true : false)
    expect(order.status_canceled?).to eq(Time.current.hour >= 17 ? true : false)
  end

  # It should invalid when 'email' attribute is blank
  it 'should invalid when email attribute is blank' do
    order = Order.new(
      email: nil,
    )
    order.valid?
    expect(order.errors[:email]).to include("can't be blank")
  end

  # It should invalid when 'email' attribute is not an email
  it 'should invalid when email attribute is not an email' do
    order1 = Order.new(
      email: "admin",
    )
    order1.valid?
    expect(order1.errors[:email]).to include("invalid email format")
  end
end
