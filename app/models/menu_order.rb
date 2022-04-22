class MenuOrder < ApplicationRecord

  # Validates
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  # Relation
  belongs_to :menu
  belongs_to :order
end
