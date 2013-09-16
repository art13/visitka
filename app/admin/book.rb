ActiveAdmin.register Book do
	menu :parent => I18n.t('librarys'), :label => I18n.t('books'), :priority=>2
	filter :lib_book
	index do 
		selectable_column
		column :book_file_name
		column :alter_name
		column :lib_book
		column :created_at
		default_actions
	end
	form do |f|
		f.inputs t('release') do 
			f.input :alter_name
		end
		f.actions
	end
	show do |release|
		attributes_table do 
			row :book_file_name
			row :alter_name
			row :created_at
			row :lib_book
		end
	end
end