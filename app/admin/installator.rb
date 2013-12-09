ActiveAdmin.register Installator,  { :sort_order => :id_asc } do
		menu :priority=>2, :parent => I18n.t('download_materials'), :label => I18n.t('installators'), :priority=>2
		filter false
 	scope :all, :default => true
	config.per_page = 8
	index do 
         selectable_column		
		 column :name
         column :version
         default_actions
	end
	form do |f|
        f.inputs do 
        	f.input :name
        	f.input :version

        end
        f.inputs t('file') do
          f.input :installator, as: :file, :hint =>unless installator.installator.url=='/installators/original/missing.png'
				t('current_file')+installator.installator.url.split('/').last.split('?').first
            end
        end
        f.actions
	end
end