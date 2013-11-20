$('document').ready(function(){
	$('body').on('click','.request',function(){
		var version='13d5a'
		var material_id='1'
		var key='1031-13d5a-6aafb9'
		var info='qwerty qwerty qwerty qwerty'
		$.ajax({
			url : '/installments',
			type: 'POST',
			data: {version:version, material_id:material_id, key:key, info:info},
			succsess : status
		});
		console.log(status);
	});
});
