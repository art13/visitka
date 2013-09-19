ActiveAdmin.register Client do 
	menu :parent => I18n.t('mans'), :label =>I18n.t('clients'), :priority=>3
	filter :false
	index do 
		selectable_column
		column :name
		column :comment
		default_actions
	end
	form do |f|
		f.inputs do 
			f.input :name
			f.input :photo, as: :file
			f.input :comment, :hint=>I18n.t('max_client_comment')

		end
		f.actions
	end
	show do |client|
		attributes_table do 
			row :name
			row :comment
		end
	end
end