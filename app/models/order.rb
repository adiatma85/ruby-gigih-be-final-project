class Order < ApplicationRecord
    # Enum
    enum :status, { new: 0, paid: 1, canceled: 2, }, prefix: true

    # Validates
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format"  }

    # Relation
    has_many :menu_orders
    has_many :menus, through: :menu_orders

    # After initialize
    after_initialize do
        if self.new_record?
            # values will be available for new record forms.
            self.status = is_still_open ? :new : :canceled
            self.total = 0.0
        end
    end

    # After find
    # For simple uploading, it is always change the status to canceled if the order not paid
    # until hour == 17
    after_find do
        if self.status_new? && !is_still_open
            self.status = :canceled
            self.save
        end
    end

    # Functionality to check whether is still in open hour or not
    def is_still_open
        return Time.current.hour < 17
    end
end
