ActiveAdmin.register Material,  { :sort_order => :id_asc } do
		menu :priority=>1, :parent => I18n.t('download_materials'), :label => I18n.t('materials'), :priority=>1
		filter :name, :label=> I18n.t('name_f')
 	scope :all, :default => true
	config.per_page = 8
	actions :all, :except => [:destroy]
 	index do
 		selectable_column
 		column  :name 
 		column  :version
 		column  :installer_version
 		column 	:price
 		column 	:release_file_name
 		column  :created_at
 		column  :updated_at
  		column '' do |resource|
	 		 links = ''.html_safe
	 		 links += link_to I18n.t('active_admin.view')+' ', resource_path(resource)
	 		 links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource)
	  		# links += link_to ' '+I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :data=>{:confirm =>I18n.t('destroy_alert')}
      		 links
		end
 	end
 	form html: { multipart: true }do |f|
 		f.inputs t('materials') do
 			f.input :name
 			f.input :installer_version
 			f.input :installator, as: :select , :collection => Installator.all.map { |a| [ a.name+' v-'+ a.version, a.id]}
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
			f.input :release, as: :file, :hint =>unless material.release.url=='/releases/original/missing.png'
				t('current_file')+material.release.url.split('/').last.split('?').first
			end	
		end

		f.actions
	end
	show  :download_links => false  do |page|
		 attributes_table do 	
              row :name
              row :version
              row :installer_version
			  row :price
			  row :description
			  row :features 
			  row :release_file_name
	     end     
	end
end