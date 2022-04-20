class Category < ApplicationRecord
    # Validates
    validates :name, presence: true, uniqueness: true

    # Relation
    has_many :menu_categories
    has_many :menus, through: :menu_categories
end
