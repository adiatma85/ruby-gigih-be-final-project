class Order < ApplicationRecord
    # Enum
    enum :status, { new: 0, paid: 1, canceled: 2, }, prefix: true

    # Validates
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid email format"  }

    # After initialize
    after_initialize do
        if self.new_record?
            # values will be available for new record forms.
            self.status = (is_still_open?) ? :new : :canceled
            self.total = 0.0
        end
    end

    # Functionality to check whether is still in open hour or not
    def is_still_open?
        return Time.current.hour < 17
    end
end
