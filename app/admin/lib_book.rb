ActiveAdmin.register LibBook,  { :sort_order => :id_asc } do
		menu :parent => I18n.t('librarys'), :label => I18n.t('library'), :priority=>1
		filter :title, :label=> I18n.t('title_f')
 	scope :all, :default => true
	config.per_page = 8
 	index do
 		selectable_column
 		column  :title 
 		#column  :created_at
  		default_actions
 	end
 	form html: { multipart: true }do |f|
 		f.inputs t('materials') do
 			f.input :title
 			f.input :photo, as: :file
			f.input :content,  as: :wysihtml5
	
		end

		f.inputs t('books') do
			f.has_many :books do |i|
				i.input :alter_name
				i.input :book, :as=> :file
				i.input :_destroy, as: :boolean
			end
		end
		f.actions
	end
	show  :download_links => false  do |page|
		 attributes_table do 	
              row :title
			  row :content 
	     end
	     
	end
end