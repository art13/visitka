#encoding: utf-8
ActiveAdmin.register DataContact do
	menu  :label =>I18n.t('data_firm'), :priority=>1
	filter :false
	actions :all, :except => [:new,:destroy]
	index do 
		column :name
		column :address
		column :phone
		column :email
		column '' do |resource|
	 		 links = ''.html_safe
	 		 links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
	  		 links += link_to I18n.t('active_admin.view'), resource_path(resource)
      		 links
		end
	end
	form do |f|
		f.inputs t('contact_data') do 
			f.input :name
			f.input :address
			f.input :email
			f.input :phone
			f.input :photo, as: :file
			f.input :delete_photo, as: :boolean
		end	
		f.inputs t('deliver_data')do
			f.input :deliver_email, :hint=>I18n.t('current_email')
			f.input :deliver_pass
		end
		f.inputs t('about') do
			f.input :preview, :hint=>I18n.t('max_client_preview')
			f.input :about, as: :wysihtml5
		end
		f.actions
	end
	  show  :download_links => false do |data_contact|   
        attributes_table do
          row :name
          row :address
          row :email
          row :phone
          row :preview
          row :about
        end
      end

end