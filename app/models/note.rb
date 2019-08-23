class Note < ApplicationRecord
	belongs_to :user,required: false
	has_many :borrow_books
	validates :title, presence:{message: "please enter book title"}
	validates :number_of_books, presence:{message: "please enter book quantity"}
	
	def self.search(search)
		if search
			where("title ILIKE ?","%#{search}%")
		else
			all
		end  
	end       
end
