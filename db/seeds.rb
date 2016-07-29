#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	InfoPost.create([{:title=>'Как купить и установить'},{:title=>'Как использовать установщик'}])
	DataContact.create([{about: "ООО «Лофт» разработано и реализуется специализированное программное обеспечение для автоматизации расчета затрат на выполнение лесохозяйственных работ. Команда экспертов ООО «Лофт» состоит из профессиональных консультантов, сочетающих блестящее образование, и практический опыт в реализации проектов, связанных с недвижимостью и лесным хозяйством.",address:"156000, г.Кострома, ул.Горная, д.3  ",email: "loft.ibesk@gmail.com",id: 1,name: " ООО «Лофт» ",phone: "8(4942)31-02-09",preview:"ООО «Лофт» специализируется на услугах по инвестиционному и бизнес консультированию, управлению проектами, связанными с недвижимостью и лесным хозяйством."}])
