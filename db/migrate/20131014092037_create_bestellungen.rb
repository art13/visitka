class CreateBestellungen < ActiveRecord::Migration
  def change 
  	create_table :bestellung do |t|
  		t.string :number
  		t.integer :order_id
  		t.string :status
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
