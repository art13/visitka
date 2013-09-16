ActiveAdmin.register ChildrenPage do 
	menu :parent => I18n.t('informations'), :label =>I18n.t('m_children_pages'), :priority=>3
	filter :title, :label=>I18n.t("title_f")
	filter :page
	index do 
		selectable_column
		column :title
		column :page
		default_actions
	end
	form do |f|
		f.inputs do
			f.input :title
			f.input :page, as: :select
			f.input :photo, as: :file
			f.input :content, as: :wysihtml5
		end
		f.actions
	end
	show do |children_page|
		attributes_table do 
			row :title
			#row :photo
			row :page
			row :content
		end
	end


end