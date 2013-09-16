class CreateMaterials < ActiveRecord::Migration
  def change
  	create_table :materials do |t|
  		t.string :name, :null=>false
  		t.string :description
  		t.timestamps
  	end
  end
end
