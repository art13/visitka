class CreateMaterials < ActiveRecord::Migration
  def change
  	create_table :materials do |t|
  		t.string :name, :null=>false
      t.string :version
      t.string :installer_version
  		t.string :preview
  		t.text :price_description
  		t.decimal :price
  		t.text :description
  		t.text :features
      t.integer :installator_id
      t.attachment :release
  		t.timestamps
  	end
  end
end
