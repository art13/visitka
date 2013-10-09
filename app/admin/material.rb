ActiveAdmin.register Material,  { :sort_order => :id_asc } do
		menu :parent => I18n.t('download_materials'), :label => I18n.t('materials'), :priority=>1
		filter :name, :label=> I18n.t('name_f')
 	scope :all, :default => true
	config.per_page = 8
 	index do
 		selectable_column
 		column  :name 
 		column  :version
 		column 	:price
 		column 	:release_file_name
 		column  :created_at
 		column  :updated_at
  		default_actions
 	end
 	form html: { multipart: true }do |f|
 		f.inputs t('materials') do
 			f.input :name
 			f.input :preview, :hint=>I18n.t('max_client_comment')
 			f.input :version, as: :radio, :collection => [t('demo'),t('full')]
			f.input :description,  as: :wysihtml5
			f.input :features, as: :wysihtml5
		end
		f.inputs t('pricing') do 
			f.input :price
			f.input :price_description
		end
		f.inputs t('file') do
			f.input :release, as: :file
		end
		f.actions
	end
	show  :download_links => false  do |page|
		 attributes_table do 	
              row :name
              row :version
			  row :price
			  row :description
			  row :features 
			  row :release_file_name
	     end     
	end
end