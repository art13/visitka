class CreateMaterials < ActiveRecord::Migration
  def change
  	create_table :materials do |t|
  		t.string :name, :null=>false
  		t.string :preview
  		t.text :description
  		t.timestamps
  	end
  end
end
