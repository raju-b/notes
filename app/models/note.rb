class Note < ApplicationRecord
	belongs_to :user,required: false
	validates :title, presence: true
  validates :body, presence: true
  validates :tag,presence: true             
end
