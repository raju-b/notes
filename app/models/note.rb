class Note < ApplicationRecord
	belongs_to :user,required: false
	validates :title, presence:{message: "please enter book name"}
  def self.search(search)
	  	if search
				where("title ILIKE ?","%#{search}%")
			else
				all
			end  
	end       
end
