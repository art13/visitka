$('document').ready(function(){
	var perl='';
	$('.button_tab a').on('click',function(){
		$('.button_tab').children().children().removeClass('active_btn');
		$(this).addClass('active_btn');
		perl = $(this).attr('id');
		$.post('/account',{perl:perl});

	});
	$('body').on('click','.contr_btn',function(){
		$('.button_tab').children().children().removeClass('active_btn');
		perl = 'question';
		$(document.getElementById(perl)).addClass('active_btn');
		$.post('/account',{perl:perl});
	
	});

	$('body').on('click','#save_order',function(){
		$('#contact-form').trigger('submit');
		$('#order_form').trigger('submit');
	});
	$('body').on('change','.item-quantity',function(){
		var sum=0;		
		var q=$(this).val();
		var p=$(this).parent().parent().find('.prpr').val();
		sum=q*p
		$(this).parent().parent().find('.summa').html('<label>'+sum+'</label>')
	});	
});
