class StudentsController < ApplicationController

	def index
		@students = Student.order(:email)
	end

	def show
		@note = Note.find_by_id(params[:note_id])
		@borrowed_books = current_user.borrow_books.includes(:note).where(note_id: params[:note_id])
	end
end
