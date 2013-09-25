class CreateDataContacts < ActiveRecord::Migration
  def change
  	create_table :data_contacts do |t|
  		t.string :name
  		t.string :address
  		t.string :email
  		t.string :phone
  		t.string :preview
  		t.text   :about
  		t.attachment :photo
  	end
  	
  end
end
