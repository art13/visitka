ActiveAdmin.register InfoPost do
	menu :parent => I18n.t('informations'), :label =>I18n.t('info_posts'), :priority=>3
	filter :false
	actions :all, :except => [:new,:destroy]
	index do
		column :title
		column '' do |resource|
	 		 links = ''.html_safe
	 		 links += link_to I18n.t('active_admin.edit'), edit_resource_path(resource), :class => "member_link edit_link"
	  		 links += link_to I18n.t('active_admin.view'), resource_path(resource)
      		 links
		end
	end
	form do |f|
		f.inputs t('change_content') do 
			f.input :content, as: :wysihtml5
		end
		f.actions
	end 
	show do |info_post|
		attributes_table do
			row :title
			row :content
		end
	end

end