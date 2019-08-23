class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_note, only: [:show, :update, :destroy, :edit, :borrow, :borrowers_list]
	def index
		@notes = Note.search(params[:search])
	end

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		if @note.save
			redirect_to notes_path
		else
			render 'new'
		end
	end
	def show
  end
  def edit
  end
  def update
  	if @note.update(note_params)
  		redirect_to @note
  	else
  		render 'edit'
  	end
  end
  def destroy
  	@note.destroy
  	redirect_to notes_path
  end

  def borrow
  	qty = @note && @note.number_of_books
  	if qty > 0
  		BorrowBook.create(note_id: @note.id, student_id: current_user.id, issued_date: Date.today, expired_date: Date.today+10)
  		@note.update_column("number_of_books", qty-1)
	end
  flash[:message] = "Book borrowed successfully"
  	redirect_to notes_path
  end
  def borrowers_list
  	@borrowers = @note && @note.borrow_books
  end

  def return
  	borrow_book = BorrowBook.find_by_id(params[:id])
   book_note =  borrow_book.note
  	borrow_book.update_column("is_returned",true)
  	book_note.update_column("number_of_books",book_note.number_of_books+1)
  	redirect_to borrowers_list_notes_path(id: borrow_book.note_id)
  end

private
	def note_params
		params.require(:note).permit(:title,:body,:tag, :number_of_books)
	end
	def find_note
		@note = Note.find_by_id(params[:id])
	end

end
