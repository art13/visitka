ActiveAdmin.register Expert do 
	menu :parent => I18n.t('mans'), :label => I18n.t('experts'), :priority=>2
	filter :email, :label => I18n.t('email_f')
	#filter :created_at, :label => I18n.t('created_at_f')

	index do 
		selectable_column
		column t('lastname'), :lastname
		column t('firstname'), :firstname
		column t('secondname'), :secondname
		column t('email'), :email
		column t('phone'), :phone
		default_actions
	end
	form do |f|
		f.inputs t('expert') do 
			f.input :lastname, :label => I18n.t('lastname')
			f.input :firstname,:label => I18n.t('firstname')
			f.input :secondname, :label=>I18n.t('secondname')
			f.input :photo, as: :file , :label=>I18n.t('load_photo')
			f.input :email, :label=>I18n.t('email')
			f.input :phone, :label=>I18n.t('phone')
		end
		f.actions
	end
	  show  :download_links => false do |expert|   
        attributes_table do
          row :lastname
          row :firstname
          row :secondname
          row :email
          row :phone
        end
      end
end