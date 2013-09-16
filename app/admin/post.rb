ActiveAdmin.register Post do
	menu :parent => I18n.t('informations'), :label =>I18n.t('news'), :priority=>1
	filter :title, :label => I18n.t('title_f')
	filter :created_at, :label => I18n.t('created_at_f')

	index do 
		selectable_column
		column t('title'), :title
		column t('created_at'), :created_at 
		default_actions
	end
	form do |f|
		f.inputs t('news_single') do 
			f.input :title, :label => I18n.t('title')
			f.input :content,:label => I18n.t('content'),as: :wysihtml5 
			f.input :photo, as: :file, :label => I18n.t('image')
		end
		f.actions
	end
	  show  :download_links => false do |admin_post|   
        attributes_table do
          row :title
          row :content 
        end
      end

end