$('document').ready(function(){
	$('body').on('click','.request',function(){
		var installer_version='13d5a'
		var programm_version='1'
		var key='171141-13d5a-8e4311'
		var info='asdasdasdasd'
		$.ajax({
			url : '/installments',
			type: 'POST',
			data: {programm_version:programm_version, installer_version:installer_version, key:key, info:info},
			succsess : status
		});
		console.log(status);
	});
});
