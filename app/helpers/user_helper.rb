#encoding: utf-8
module UserHelper
	def list_order(order)
		[
			{"Адрес: " => order.address},
			{"Реквизиты: " => order.inn}, 
			{"Субъект РФ: " => order.region}, 
			{"Телефон: " => order.phone}, 
			{"Email: " => order.email}, 
			{"Факс: " => order.faks},
			{"Контактное лицо: " => order.contact},
			{"ОГРН: " =>order.ogrn},
			{"Руководитель: " => order.manager},
			{"Название банка: " => order.bank_name},
			{"Расчётный счёт: " => order.ras_schet},
			{"Корреспондентский стчёт: " => order.kor_schet},
			{"БИК: " => order.bik},
			{"Дата создания: " => order.created_at.to_date}
		]
	end
end 