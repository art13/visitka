ActiveAdmin.register ProgramsFeature do 
	menu :parent => I18n.t('download_materials'), :label => I18n.t('features'), :priority=>2
	filter :material
	index :download_links => false do
		selectable_column 
		column :title
		column :material
		default_actions
	end
	form do |f|
		f.inputs do
			f.input :title
			f.input :material, as: :select
			f.input :description, as: :wysihtml5
		end
		f.actions

	end
	show do 
		attributes_table do
			row :title
			row :material
			row :description
		end
	end

end