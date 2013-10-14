$('document').ready(function(){
	var perl='';
	$('.button_tab a').on('click',function(){
		$('.button_tab').children().children().removeClass('active_btn');
		$(this).addClass('active_btn');
		perl = $(this).attr('id');
		$.post('/account',{perl:perl},function(){
			var availableTags = [
				"Москва и Подмосковье",
				"Санкт-Петербург и область",
				"Амурская область",
				"Камчатский край",
				"Приморский край",
				"Республика Саха (Якутия)",
				"Сахалинская область",
				"Хабаровский край",
				"Кировская область",
				"Нижегородская область",
				"Оренбургская область",
				"Пензенская область",
				"Пермский край",
				"Республика Башкортостан",
				"Республика Марий Эл",
				"Республика Мордовия",
				"Республика Татарстан",
				"Республика Татарстан - Набережные Челны",
				"Республика Удмуртия",
				"Республика Чувашия",
				"Самарская область",
				"Саратовская область",
				"Ульяновская область",
				"Архангельская область",
				"Вологодская область",
				"Мурманская область",
				"Новгородская область",
				"Псковская область",
				"Республика Коми",
				"Республика Дагестан",
				"Республика Кабардино-Балкария",
				"Республика Северная Осетия-Алания",
				"Ставропольский край",
				"Алтайский край",
				"Забайкальский край",
				"Иркутская область",
				"Кемеровская область",
				"Красноярский край",
				"Новосибирская область",
				"Омская область",
				"Республика Алтай",
				"Республика Бурятия",
				"Республика Хакасия",
				"Томская область",
				"Курганская область",
				"Республика Башкортостан",
				"Свердловская область",
				"Тюменская область",
				"Ханты-Мансийский АО",
				"Челябинская область",
				"Белгородская область",
				"Брянская область",
				"Владимирская область",
				"Воронежская область",
				"Ивановская область",
				"Калужская область",
				"Костромская область",
				"Курская область",
				"Липецкая область",
				"Орловская область",
				"Рязанская область",
				"Смоленская область",
				"Тамбовская область",
				"Тверская область",
				"Тульская область",
				"Ярославская область",
				"Астраханская область",
				"Волгоградская область",
				"Краснодарский край",
				"Республика Адыгея",
				"Ростовская область"
		    ];
		    $( "#tags1" ).autocomplete({
		      source: availableTags
			});			
		});	  
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
