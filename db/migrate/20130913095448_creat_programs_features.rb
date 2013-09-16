class CreatProgramsFeatures < ActiveRecord::Migration
  def change
  	create_table :programs_features do |t|
  		t.string :title
  		t.text :description
  		t.integer :material_id
  	end 	
  end
end
