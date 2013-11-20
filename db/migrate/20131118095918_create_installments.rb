class CreateInstallments < ActiveRecord::Migration
  def change
  	 create_table :installments do |t|
  	 	t.string :product_key
  	 	t.string :license_key
      t.string :installer_version
  	 	t.integer :user_id
  	 	t.integer :material_id
  	 	t.string :status
      t.string :info
  	 	t.integer :statement
      t.string :state
      t.timestamps
  	 end
  	
  end
end
