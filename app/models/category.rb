class Category < ApplicationRecord
    # Validates
    validates :name, presence: true, uniqueness: true
end
