ActiveAdmin.register Page do 
	menu :parent => I18n.t('informations'), :label =>I18n.t('m_pages'), :priority=>2
	filter :title, :label=>I18n.t("title_f")
	index do 
		selectable_column
		column :title
		default_actions
	end
	form do |f|
		f.inputs do
			f.input :title
			f.input :photo, as: :file
			f.input :delete_photo, as: :boolean
			f.input :content, as: :wysihtml5
		end
		f.actions
	end
	show do |page|
		attributes_table do 
			row :title
			#row :photo
			row :content
		end
	end


end