class MenuOrder < ApplicationRecord

  # Relation
  belongs_to :menu
  belongs_to :order
end
