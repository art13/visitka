$('.empty-li').each(function(){
	if ($(this).html()==" " || $(this).html()=="")
		{
			$(this).parent().empty();
		}
});
		


