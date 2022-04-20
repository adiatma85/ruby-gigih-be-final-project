class Menu < ApplicationRecord
    # Validates
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
