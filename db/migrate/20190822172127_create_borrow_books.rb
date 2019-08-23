class CreateBorrowBooks < ActiveRecord::Migration[5.1]
	def change
		create_table :borrow_books do |t|
			t.integer :student_id
			t.integer :note_id
			t.date :issued_date
			t.date :expired_date
			t.boolean :is_returned, default: false
			t.timestamps
		end
	end
end
