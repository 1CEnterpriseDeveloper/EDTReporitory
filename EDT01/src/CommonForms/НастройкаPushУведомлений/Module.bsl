&НаКлиенте
Процедура ЗагрузитьСертификат(Команда)
	Оповещение = Новый ОписаниеОповещения("ЗагрузитьСертификатЗавершение", ЭтотОбъект);
	НачатьПомещениеФайла(Оповещение, , "", Истина, УникальныйИдентификатор);
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьСертификатЗавершение(Результат, АдресВременногоХранилища, ВыбранноеИмя, ДополнительныеПараметры) Экспорт
	Если Результат Тогда
		АдресСертификата = АдресВременногоХранилища;
		СертификатЗагружен = Не ПустаяСтрока(АдресСертификата);
	КонецЕсли;
КонецПроцедуры


&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если АдресСертификата <> "" Тогда
		ДвоичныеДанные = ПолучитьИзВременногоХранилища(АдресСертификата);
		Константы.СертификатМобильногоПриложенияIOS.Установить(Новый ХранилищеЗначения(ДвоичныеДанные, Новый СжатиеДанных()));
	КонецЕсли;
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Сертификат = Константы.СертификатМобильногоПриложенияIOS.Получить().Получить();
	СертификатЗагружен = ЗначениеЗаполнено(Сертификат);
	ИспользоватьPushУведомленияПриИзмененииНаСервере();

КонецПроцедуры


&НаКлиенте
Процедура ИспользоватьPushУведомленияПриИзменении(Элемент)
	ИспользоватьPushУведомленияПриИзмененииНаСервере();
КонецПроцедуры


&НаСервере
Процедура ИспользоватьPushУведомленияПриИзмененииНаСервере()
	Если Объект.ИспользоватьPushУведомления = Перечисления.PushУведомления.ИспользоватьВспомогательныйСервис Тогда
		Элементы.Локальные.Видимость = Ложь;
		Элементы.Сервис.Видимость = Истина;
	ИначеЕсли Объект.ИспользоватьPushУведомления = Перечисления.PushУведомления.ОтправлятьНепосредственно Тогда
		Элементы.Локальные.Видимость = Истина;
		Элементы.Сервис.Видимость = Ложь;
	Иначе
		Элементы.Локальные.Видимость = Ложь;
		Элементы.Сервис.Видимость = Ложь;
	КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура ПолучитьЛогин(Команда)
	ПерейтиПоНавигационнойСсылке("https://pushnotifications.1c.com/push/publishers/new");
КонецПроцедуры

