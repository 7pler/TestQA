﻿#language: ru

@tree

Функционал: Проверка заполнения поля количество (итог) в документе Заказ

Как Менеджер по продажам я хочу
автоматический расчет количество (итог) в документе Заказ
чтобы предоставить клиенту корректную информацию о количестве

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Заполнение документа заказ
* открытие формы документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
* заполнение шапки документа
	И Заполнение шапки документа заказ (внешний)
* проверка расчета количество (итог) для пустой тч
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '0'
* проверка расчета количество (итог) для товара в одной строке тч
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '1'
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
* проверка расчета количество (итог) для товара в нескольких строках тч
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000026' | 'Молоко'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'	
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '3'	
* проверка расчета количество (итог) при удалении строки тч	
	И в таблице "Товары" я перехожу к строке:
		| 'Товар'  |
		| 'Молоко' |	
	И в таблице 'Товары' я удаляю строку
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '2'
	И в таблице "Товары" я перехожу к строке:
		| 'Товар' |
		| 'Торт ' |
	И в таблице 'Товары' я удаляю строку
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '0'
* проверка расчета количество (итог) для услуги в одной строке тч
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '1'
* проверка расчета количество (итог) для комбинации товаров и услуг в нескольких строках тч
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	Тогда элемент формы с именем "ТоварыИтогКоличество" стал равен '3'
* закрытие формы документа без сохранения
	И Я закрываю окно 'Заказ (создание) *'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку с именем 'Button1'
		
