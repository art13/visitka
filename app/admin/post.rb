ActiveAdmin.register Post do
	menu :parent => I18n.t('informations'), :label =>I18n.t('news'), :priority=>1
	filter :title, :label => I18n.t('title_f')
	filter :created_at, :label => I18n.t('created_at_f')
	config.sort_order = "id_desc"
	index do 
		selectable_column
		column :title
		column :preview
		column t('created_at'), :created_at 
		default_actions
	end
	form do |f|
		f.inputs t('news_single') do 
			f.input :title
			f.input :preview, :hint=>I18n.t('max_client_comment')
			f.input :photo, as: :file
			f.input :delete_photo, as: :boolean
			f.input :content,as: :wysihtml5 
		
		end
		f.actions
	end
	  show  :download_links => false do |admin_post|   
        attributes_table do
          row :title
          row :preview
          row :content 
        end
      end

end