class NotesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_note, only: [:show, :update, :destroy, :edit]
	def index
		@notes = Note.order(created_at: 'DESC').all
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

	private
	def note_params
		params.require(:note).permit(:title,:body,:tag)
	end
	def find_note
		@note = Note.find_by_id(params[:id])
	end

end
