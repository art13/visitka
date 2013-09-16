ActiveAdmin.register Material,  { :sort_order => :id_asc } do
		menu :parent => I18n.t('download_materials'), :label => I18n.t('materials'), :priority=>1
		filter :name, :label=> I18n.t('name_f')
 	scope :all, :default => true
	config.per_page = 8
 	index do
 		selectable_column
 		column  :name 
 		column  :created_at
 		column  :updated_at
  		default_actions
 	end
 	form html: { multipart: true }do |f|
 		f.inputs t('materials') do
 			f.input :name
			f.input :description,  as: :wysihtml5
		end
		f.inputs t('file') do
			f.has_many :releases do |i|
				i.input :alter_name
				i.input :release, :as=> :file
				i.input :_destroy, as: :boolean
			end
		end
		f.actions
	end
	show  :download_links => false  do |page|
		 attributes_table do 	
              row :name
			  row :description 
	     end
	     
	end
end