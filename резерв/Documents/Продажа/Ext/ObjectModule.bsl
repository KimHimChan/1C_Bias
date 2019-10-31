﻿
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	// Вставить содержимое обработчика.
	СпрТовар = Справочники.Товар;
	Для Каждого ТекущаяСтрока Из ПроданныйТовар Цикл 
		Товар = СпрТовар.НайтиПоНаименованию(ТекущаяСтрока.Наименование).ПолучитьОбъект();
		Товар.Количество = Товар.Количество - ТекущаяСтрока.Количество;
			Если Товар.Количество = 0 Тогда
				Товар.Доступность = Перечисления.ДоступностьТовара.Отсутствует;
			КонецЕсли;
		Товар.Записать();
	КонецЦикла;
КонецПроцедуры
