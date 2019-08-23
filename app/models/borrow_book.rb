class BorrowBook < ApplicationRecord
	belongs_to :student
	belongs_to :note

	scope :active, -> {where(is_returned: false)}
end
