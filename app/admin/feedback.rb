ActiveAdmin.register Feedback, { :sort_order => :id_asc } do
		menu :label => I18n.t('feedbacks')
		filter :email, :label => I18n.t('email_f')
	scope :all, :default => true
	config.per_page = 8
	index do
		selectable_column
		column t('fio'), :fio
		column t('email'), :email
		column t('question'), :message
		column t('subscribe'), :subscribe
		column '' do |resource|
	  links = ''.html_safe
	  links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link"
	  links += link_to I18n.t('active_admin.delete'), resource_path(resource), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'), :class => "member_link delete_link"
      links
	end
	end
	show  do |feedback|   
        attributes_table do
          row :fio
          row :email
          row :message
        end
    end
end
