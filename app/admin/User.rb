ActiveAdmin.register User do 
	menu :parent =>I18n.t('mans'), :label=>I18n.t('users'), :priority=>5
	filter :false
	actions :all, :except => [:new,:edit]
	scope :all
	scope :interested
	index do 
		selectable_column
		column :email
		column '' do |resource|
		  links = ''.html_safe
		  links += link_to I18n.t('active_admin.view'), resource_path(resource), :class => "member_link"	 
	      links
		end
	end
	show  :download_links => false do |user|  
		div :class=>'user_info' do
		 	attributes_table do
	          row :email
	          row :contact
	          row :company
	          row :region
	          row :phone
	          row :created_at
	          row :updated_at
	          row :current_sign_in_at
	          row :last_sign_in_at
	          row :sign_in_count
	        end
		end 
		div :class=>'user_orders' do 
			panel I18n.t('user_orders') do
				table_for user.orders do |order|
						column :id
						column t('created_at'),:created_at
						column t('status'), :status
						
				end
			end
		end 
    end
end