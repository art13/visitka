class CreateOrders < ActiveRecord::Migration
  def change
  	 create_table :orders do |t|
  	 	t.decimal :total
  	 	t.string  :status
  	 	t.integer :user_id
  	 	#t.integer :questionnaire_id
  	 	t.string :region
  	 	t.string :name
		t.string :address
		t.string :inn
		t.string :phone
		t.string :email
		t.string :faks
		t.string :contact
		t.string :manager
		t.string :bank_name
		t.string :ras_schet
		t.string :kor_schet
		t.string :bik	
  	 	t.timestamps
  	 end
  end
end
