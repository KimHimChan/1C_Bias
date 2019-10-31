﻿
&НаКлиенте
Процедура ПроданныйТоварНаименованиеПриИзменении(Элемент)
	//Изменение цены в зависимости от выбора наименования:
	
	ТекСтрока = Элементы.ПроданныйТовар.ТекущиеДанные;
	ТекСтрока.Цена = ВозвратЦены(ТекСтрока.Наименование);
	
КонецПроцедуры

&НаКлиенте
Процедура ПроданныйТоварКоличествоПриИзменении(Элемент)
	// Подсчет стоимости для товара
	
	ТекСтрока = Элементы.ПроданныйТовар.ТекущиеДанные;
	ИзменениеКоличества(ТекСтрока.Наименование, ТекСтрока.Количество);
	ТекСтрока.Цена = ВозвратЦены(ТекСтрока.Наименование);
	ТекСтрока.Стоимость = ТекСтрока.Количество * ТекСтрока.Цена;
	
КонецПроцедуры

&НаСервере
Функция ВозвратЦены(Значение)
	Ссылка = Справочники.Товар.НайтиПоНаименованию(Значение);
	Товар = Ссылка.ПолучитьОбъект();
	Возврат Товар.Цена;
КонецФункции

Функция ИзменениеКоличества(Название, Значение)
	Ссылка = Справочники.Товар.НайтиПоНаименованию(Название);
	Товар = Ссылка.ПолучитьОбъект();	Если Товар.Количество >= Значение Тогда
		Разность = Товар.Количество - Значение;
		Товар.Количество = Разность;
		Если Товар.Количество = 0 Тогда 
			Товар.Доступность = Перечисления.ДоступностьТовара.Отсутствует;
		КонецЕсли;
		Товар.Записать();
	Иначе 
		Если Товар.Количество = 0 Тогда 
			Сообщить("Товар отсутствует!");
		Иначе
			Сообщить("На складе нет токого количество товара!");
		КонецЕсли;
	КонецЕсли;	
КонецФункции

