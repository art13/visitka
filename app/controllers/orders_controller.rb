# encoding: utf-8
class OrdersController < ApplicationController
   def create
      @products=Material.where('version=?','Полная')
   	@order=Order.new
            @order.status=params[:order][:status]
            @order.save
               line_items=params[:order][:line_items]
                  line_items.each do |key,value|
                     if @order.line_items.find_by_material_id(key).nil?
                         @order.line_items.create(:material_id=>key,:price=>value[:price],:quantity=>value[:quantity])
                     else
                        item=@order.line_items.find_by_material_id(key)
                        item.quantity=value[:quantity]
                        item.save
                        #@order.line_items.create(:material_id=>key,:price=>value[:price],:quantity=>value[:quantity])
                     end
                  end
            @line_destr=LineItem.where('order_id=?',@order.id).where('quantity=?',0)
            @line_destr.each do |item|
               LineItem.find(item.id).destroy
            end       
            @del_orders=Order.where('user_id=?',current_user.id)
            # @del_orders.each do |order|
            #    if order.line_items.empty?   
            #       Order.find(order.id).destroy
            #    end
            # end 
                 
         if @order.save
            flag=1
               respond_to do |format|
                  format.js
               end
         else
            flag=2
            flash['mess_error']='something want wrong'
         end	
   end
   def edit

   end
   def update   	

   end
   
end