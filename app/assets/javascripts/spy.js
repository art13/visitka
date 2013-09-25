$('document').ready(function(){
	var body=$('body').attr('class');
	if (body=='pages' || body=='children_pages')
		{ $('.menus').children().removeClass('active');
		$('.menus').children().filter('#programs_features').addClass('active');}
	else
	{
		$('.menus').children().removeClass('active');
		$('.menus').children().filter('#'+body).addClass('active');
	}

});

