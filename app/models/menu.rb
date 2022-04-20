class Menu < ApplicationRecord
    # Validates
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true, length: {maximum: 150}
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }

    # Relation
    has_many :menu_categories
    has_many :categories, through: :menu_categories
end
