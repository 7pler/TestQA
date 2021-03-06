#language: ru

@tree
@ExportScenarios

Функционал: Открытие карточки отчета Остатки товаров и сброс настроек

Сценарий: Я открываю отчет Остатки товаров и сбрасываю настройки до стандартных
	* открытие отчета
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Товарные запасы' 'Остатки товаров'
		Тогда открылось окно 'Остатки товаров'
	* выбор варианта отчета основной	
		И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
		Тогда открылось окно 'Выбор варианта отчета'
		И в таблице "СписокНастроек" я перехожу к строке
			| 'Представление' |
			| 'Основной'      |
		И я нажимаю на кнопку с именем 'Загрузить'
		//пауза, чтобы прогрузились настройки
		И Пауза 3
	* сброс пользовательских настроек
		И я нажимаю на кнопку с именем 'ФормаСтандартныеНастройки'
		И Пауза 3
