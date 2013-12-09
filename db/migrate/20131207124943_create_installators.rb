class CreateInstallators < ActiveRecord::Migration
  def change
  	 create_table :installators do |t|
  	 	t.string :name
  	 	t.string :version
  	 	t.attachment :installator
  	 end
  end
end
