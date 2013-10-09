# ActiveAdmin.register Release do
# menu :parent => I18n.t('download_materials'), :label => I18n.t('releases'), :priority=>2
# filter :false
# index do 
# 	selectable_column
# 	column :release_file_name
# 	column :alter_name
# 	column :material
# 	column :demo
# 	column :created_at
# 	default_actions
# end
# form do |f|
# 	f.inputs t('release') do 
# 		f.input :alter_name
# 		f.input :demo
# 	end
# 	f.actions
# end
# show do |release|
# 	attributes_table do 
# 		row :release_file_name
# 		row :alter_name
# 		row :created_at
# 		row :material
# 		row :demo
# 	end
# end
# end