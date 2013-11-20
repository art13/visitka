//= require active_admin/base
$('document').ready(function(){
	$('body').on('click','.lk_create',function(){
		var order_id=document.location.pathname.split('/')[3];
		$.post('/lic_keys',{order_id:order_id},function(){
  			alert("Ключи сгенерированы")}
		       );
		console.log(order_id);
	});
	$('body').on('click','.generate-new',function(){
			var key_id=$(this).parent().parent().attr('id').split('_')[2]
			var order_id=document.location.pathname.split('/')[3];
			$.post('/lic_keys/generate',{order_id:order_id,key_id:key_id},function(){
	  			alert("Ключ заменён")}
			       );
			console.log(order_id);
	});

	$('.order-delay').on('change',function(){
  		 if ($('.order-delay li ').last().find('input').prop('checked')==true)
      		   {
     		      $('.order-date').addClass('create-order');
     		      $('.order-number').addClass('create-order');
     		   }
   		 else
   		   {
   		      $('.order-date').removeClass('create-order');
   		      $('.order-number').removeClass('create-order');
    		   }

	});
 	if ($('.order-delay li ').last().find('input').prop('checked')==true)
      		   {
     		      $('.order-date').addClass('create-order');
     		      $('.order-number').addClass('create-order');
     		   }
	else{}
});
