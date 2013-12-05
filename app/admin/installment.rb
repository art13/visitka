ActiveAdmin.register Installment do 
	menu :label =>I18n.t('installments')
	config.sort_order = "id_desc"
    filter :license_key

	index do
		selectable_column
		column :license_key
		column :installer_version
		column :status
		column :state
		column :updated_at
		default_actions
	end
	show do |installment|
		attributes_table do 
			row :license_key
			row :info
			row :product_key
			row :state
			row :status
			row :installer_version
			row :created_at
			row :updated_at
		end
	end
end