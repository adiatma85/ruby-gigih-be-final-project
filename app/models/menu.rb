class Menu < ApplicationRecord
    # Validates
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: {maximum: 150}
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }

    # Relation
    has_many :menu_categories, dependent: :delete_all
    has_many :categories, through: :menu_categories
    has_many :menu_orders, dependent: :delete_all
    has_many :orders, through: :menu_orders
end
