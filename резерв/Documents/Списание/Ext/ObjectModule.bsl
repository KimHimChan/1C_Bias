﻿
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	// Вставить содержимое обработчика.
	СпрТовар = Справочники.Товар;
	Для Каждого ТекущаяСтрока Из СписанныеТовары Цикл 
		Товар = СпрТовар.НайтиПоНаименованию(ТекущаяСтрока.Название).ПолучитьОбъект();
		Товар.Количество = 0;
		Товар.Доступность = Перечисления.ДоступностьТовара.Отсутствует;		
		Товар.Записать();
	КонецЦикла;
КонецПроцедуры
