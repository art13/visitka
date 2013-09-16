class CreateBooks < ActiveRecord::Migration
  def change
  	create_table :books do |t|
 	  t.string :book_file_name
 	  t.string :alter_name
      t.string :book_content_type
      t.integer :book_file_size
      t.datetime :book_updated_at
      t.integer :lib_book_id
      t.timestamps
 	end
  end
end
