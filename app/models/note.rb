class Note < ApplicationRecord
	belongs_to :user,required: false
	validates :title, presence: true
  validates :body, presence: true
  validates :tag,presence: true   
  def self.search(search)
	  	if search
				where("title ILIKE ?","%#{search}%")
			else
				all
			end  
	end       
end
