ActiveAdmin.register LicRequest do
	menu :parent => I18n.t('download_materials'), :label => I18n.t('lic_requests'), :priority=>3
	actions :all, :except => [:new]
	index do 
		column :name
		column :email
		column :phone
		column :confirmed
		column :created_at
		column '' do |resource|
	 		 links = ''.html_safe
	 		 links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
	  		 links += link_to I18n.t('active_admin.view'), resource_path(resource)
      		 links
		end
	end
	form do |f|
		f.inputs t('confirmeded') do
			f.input :confirmed
		end
		f.actions
	end
	show do |lic_request|
		attributes_table do
			row :name
			row :email
			row :phone
			row :confirmed
			row :created_at
			row :updated_at
		end
	end
end