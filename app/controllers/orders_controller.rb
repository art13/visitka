# encoding: utf-8
class OrdersController < ApplicationController
   def new
      @order = Order.new     
   end
   def create
      @flag1 = false
      @user = current_user
      @data = DataContact.first
      @products = Material.where('version=?','Полная')
             @order = Order.create(
                                    :status => params[:order][:status], :name => params[:order][:name], 
                                    :phone => params[:order][:phone], :email => params[:order][:email],
                                    :contact => params[:order][:contact], :address => params[:order][:address],
                                    :inn => params[:order][:inn], :faks => params[:order][:faks],
                                    :manager => params[:order][:manager], :bank_name => params[:order][:bank_name],
                                    :ras_schet => params[:order][:ras_schet], :kor_schet => params[:order][:kor_schet],
                                    :bik => params[:order][:bik], :user_id => current_user.id 
                                  )  
         if @order.save
          line_items = params[:order][:line_items]
          flash['order_errors'] = []
                  line_items.each do |key, val|
                    unless (val[:quantity].to_i) < 1 && val[:quantity].blank?    
                      @order.line_items.create(:material_id => key, :price => val[:price], :quantity => val[:quantity].to_i) 
                    end
                  end
               if @order.line_items.empty?
                  @order.line_items.destroy_all
                  @order.destroy
                  flash['order_errors'] << 'Ошибка в количестве лицензий'
               else   
                  @flag1 = true
                   OrderMailer.delay.req_order(@order,@data)
                   OrderMailer.delay.req_admin_order(@order,@data)
                  respond_to do |format|
                     format.js
                  end
               end
         else
            @flag1 = false
            flash["order_errors"] = @order.errors.full_messages
         end        
   end
   def edit

   end
   def update           

   end
   
end