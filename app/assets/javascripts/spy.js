$('document').ready(function(){
	var body=$('body').attr('class');
	$('.menus').children().removeClass('active')
	$('.menus').children().filter('#'+body).addClass('active')

});

