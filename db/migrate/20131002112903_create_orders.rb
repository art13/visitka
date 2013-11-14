class CreateOrders < ActiveRecord::Migration
  def change
  	 create_table :orders do |t|
  	 	t.decimal :total
  	 	t.integer :number
  	 	t.datetime :order_create_time
  	 	t.string  :status
  	 	t.integer :user_id
  	 	t.string :region
  	 	t.string :name
		t.string :address
		t.string :ogrn
		t.string :inn
		t.string :phone
		t.string :email
		t.string :faks
		t.string :contact
		t.string :manager
		t.string :manager_status
		t.string :manager_reason
		t.string :bank_name
		t.string :ras_schet
		t.string :kor_schet
		t.string :bik	
  	 	t.timestamps
  	 end
  end
end
