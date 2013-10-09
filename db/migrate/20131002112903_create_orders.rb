class CreateOrders < ActiveRecord::Migration
  def change
  	 create_table :orders do |t|
  	 	t.decimal :total
  	 	t.string  :status
  	 	t.integer :user_id
  	 	t.integer :questionnaire_id
  	 	t.timestamps
  	 end
  end
end
