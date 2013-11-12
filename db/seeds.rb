#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	info_posts=InfoPost.create([{:title=>'Как купить и установить'},{:title=>'Как использовать установщик'}])
	data_contacts=DataContact.create([{about: "ООО «Лофт» разработано и реализуется специализированное программное обеспечение для автоматизации расчета затрат на выполнение лесохозяйственных работ. Команда экспертов ООО «Лофт» состоит из профессиональных консультантов, сочетающих блестящее образование, и практический опыт в реализации проектов, связанных с недвижимостью и лесным хозяйством.",address:"156000, г.Кострома, ул.Горная, д.3  ",email: "loft.ibesk@gmail.com",id: 1,name: " ООО «Лофт» ",phone: "8(4942)31-02-09",preview:"ООО «Лофт» специализируется на услугах по инвестиционному и бизнес консультированию, управлению проектами, связанными с недвижимостью и лесным хозяйством."}])
	feedbacks=Feedback.create[{email: "alenakropotina@gmail.com",fio: "Alena Kropotina",id: 3,message: "test"},
		{email: "alenakropotina@gmail.com",fio: "Alena",id: 7,message: "test2"},
		{email: "koryakin_va@mail.ru",fio: "\u041a\u043e\u0440\u044f\u043a\u0438\u043d",id: 10,message: "\u0411\u0411\u0411\u0411\u0411"},
		{email: "koryakin_va@mail.ru",fio: "\u041a\u043e\u0440\u044f\u043a\u0438\u043d",id: 11,message: "\u0411\u0411\u0411\u0411\u0411"},
		{email: "koryakin_va@mail.ru",fio: "\u041a\u043e\u0440\u044f\u043a\u0438\u043d",id: 12,message: "\u0411\u0411\u0411\u0411\u0411"},
		{email: "azzalysb@gmail.com",fio: "\u041e\u041b\u041e\u041b\u041e \u043f\u044b\u0449 \u043f\u044b\u0449\u044c",id: 13,message: "JKJKJ ujuju"},
		{email: "azzalysb@gmail.com",fio: "\u041e\u041b\u041e\u041b\u041e \u043f\u044b\u0449 \u043f\u044b\u0449\u044c",id: 14,message: "JKJKJ ujuju"},
		{email: "azzaly@mail.ru",fio: "jkjkj jk kk",id: 15,message: "kjvj vj vji dvid v d;v d"}]