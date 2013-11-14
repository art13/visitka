ActiveAdmin.register Order do 
	menu :label=>I18n.t('orders')
	filter :user,:content_columns =>:email, :label=>I18n.t('user_f')
	filter :name, :label=>I18n.t('name_of')
	filter :email, :label=>I18n.t('email_f')
	filter :total, :label=>I18n.t('total_f')

	scope :cart
	scope :obrabotka
	scope :waiting
	scope :ready
	scope :all

	config.per_page=16
		index do 
			selectable_column
			column :number
			column :user
			column :name
			column :status
			column :total
			default_actions	
		end
		form do |f|

			f.inputs t('order_status') do
				f.input :status, as: :radio, :collection=> [t('cart'),t('obrabotka'),t('waiting'),t('ready')], :wrapper_html=>{:class=>'order-delay'}
				f.input :number, :wrapper_html=>{:class=>'order-number'}
				f.input :order_create_time, :as => :datetime_picker, :wrapper_html=>{:class=>'order-date'}
			end	
			f.inputs t('anketa_data') do 	
				f.input :user, as: :select,:include_blank => false
				f.input :name
				f.input :contact
				f.input :email
				f.input :phone
				f.input :faks
				f.input :address
				f.input :inn
				f.input :ogrn
				f.input :manager 
				f.input :manager_status
				f.input :manager_reason
				f.input :bank_name
				f.input :ras_schet
				f.input :kor_schet
				f.input :bik
			end
			f.actions
		end

		show :title=>I18n.t('order_details') do |order|
			div :class => 'order_all' do
			 	div :class => "order_info" do
					 	#panel I18n.t('') do
					 		attributes_table do
					 			row :user
					 			row :status
					 			if order.status == t('ready')
					 				row :number
					 				row :order_create_time
					 			end
					 			row :name
					 			row :email
					 			row :phone
					 			row :faks
					 			row :address
					 			row :inn
					 			row :ogrn
					 			row :manager
					 			row :manager_status
					 			row :manager_reason
					 			row :bank_name
					 			row :ras_schet
					 			row :kor_schet
					 			row :bik
					 			row :total
					 			logger.debug(order.status)
					 			logger.debug(order.lic_keys.empty?)
					 			if (order.status ==t('ready') && order.lic_keys.empty?)
					 				div :class=> '' do 
					 					a :class=> 'lk_create' do 
					 						t('create_lk')
					 					end
					 				end
								end
					 		end 
					 	#end

				end
				div :class => "order_items" do 
				 	panel I18n.t('line_items') do
				 		table_for order.line_items do 
				 			column t('material') do |line_item|
				 				link_to  line_item.material.name, admin_line_item_path(line_item)
					 		end
					 		column t('quantity'), :quantity
					 		column t('price'), :price
					 		column t('amount'), :amount
				 		end
				 	end
				 	unless order.lic_keys.empty?
					 	panel I18n.t('license') do 
					 		table_for order.lic_keys do |lic_key|
					 			column t('material'), :material
					 			column t('key'), :lic
					 			column t('key_status'), :status
					 		end
					 	end
				 	end
				 	active_admin_comments
				end
			end
		end

end