class CreateLineItems < ActiveRecord::Migration
  def change
  	create_table :line_items do |t|
  		t.integer :order_id
  		t.integer :material_id
  		t.decimal :price
  		t.integer :quantity
  	end
  end
end
