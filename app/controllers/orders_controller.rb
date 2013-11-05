# encoding: utf-8
class OrdersController < ApplicationController
   def new
      @order=Order.new     
   end
   def create
      @flag1=false
      @user=current_user
      @data=DataContact.first
      @products=Material.where('version=?','Полная')
   	  @order=Order.new
            @order.status=params[:order][:status]
            @order.name=params[:order][:name]
            @order.phone=params[:order][:phone]
            @order.email=params[:order][:email]
            @order.contact=params[:order][:contact]
            @order.address=params[:order][:address]
            @order.inn=params[:order][:inn]
            @order.faks=params[:order][:faks]
            @order.manager=params[:order][:manager]
            @order.bank_name=params[:order][:bank_name]
            @order.ras_schet=params[:order][:ras_schet]
            @order.kor_schet=params[:order][:kor_schet]
            @order.bik=params[:order][:bik]
            @order.user_id=current_user.id
            @order.save     
         if @order.save
          line_items=params[:order][:line_items]
                  line_items.each do |key,value|
                     if (value[:quantity].to_i)>0 && value[:quantity]!=''
                         @order.line_items.create(:material_id=>key,:price=>value[:price],:quantity=>value[:quantity])
                     end
                  end
                  OrderMailer.delay.req_order(@order,@data)
                  OrderMailer.delay.req_admin_order(@order,@data)
            @flag1=true
               respond_to do |format|
                  format.js
               end
         else
            @flag1=false
            flash["order_errors"] = @order.errors.full_messages
         end	
   end
   def edit

   end
   def update   	

   end
   
end