ActiveAdmin.register Subscriber, { :sort_order => :id_asc } do 
	menu :parent => I18n.t('mans'),:label=>I18n.t('subscribers'), :priority=>4
	filter :email, :label => I18n.t('email_f')
	index do
		selectable_column
		column t('email'), :email
		column '' do |resource|
	  links = ''.html_safe
	  links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link"
	  links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
	end
	end
	show  do |feedback|   
        attributes_table do
          row :email
        end
    end
end