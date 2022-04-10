﻿#language: ru

@tree
@ТестированиеФорм

Функционал: проверка заполнения полей документа Заказ покупателя

Как тестировщик я хочу
проверить заполнение полей документа Заказ покупателя
чтобы убедиться, что поля доступны для заполнения и введенные данные сохраняются

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: проверка заполнения полей документа Заказ покупателя
	* Загрузка тестовых данных
		И экспорт основных данных
	* Открытие формы заказа покупателя
		И я закрываю все окна клиентского приложения
		И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
	* Проверка наличия полей
		//поверим, что поле Партнер присутствует на форме
		И элемент формы "Партнер" присутствует на форме
		//поверим, что поле Соглашение присутствует на форме
		И элемент формы "Соглашение" присутствует на форме	
		//поверим, что поле Контрагент присутствует на форме
		И элемент формы "Контрагент" присутствует на форме
	* Проверка доступности поля контрагент
		//проверим, что поле контрагент не доступно при пустом партнере
		И элемент формы "Контрагент" не доступен
		//заполним партнера
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И я нажимаю на кнопку с именем 'FormList'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		//проверим, что поле контрагент доступно при заполненном партнере
		И элемент формы "Контрагент" доступен
		//контрагент должен заполниться сам при выборе партнера
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'
	* Заполнение полей, чтобы убедиться, что значения сохранятся при записи документа
		И я нажимаю кнопку выбора у поля с именем "Agreement"
		И в таблице "List" я перехожу к строке:
			| 'Вид'     | 'Вид взаиморасчетов' | 'Код' | 'Наименование'                                        |
			| 'Обычное' | 'По соглашениям'     | '3'   | 'Индивидуальное соглашение 2 (расчет по соглашениям)' |
		И в таблице "List" я выбираю текущую строку
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'
	* Запись и закрытие документа
		И я нажимаю на кнопку с именем 'FormWrite'
		И я запоминаю значение поля "Номер" как "НомерДокумента"
		И я закрываю все окна клиентского приложения
	* Повторное открытие документа
		И Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"								
		И в таблице "List" я перехожу к строке:
			| 'Номер'            |
			| '$НомерДокумента$' |
		И в таблице "List" я выбираю текущую строку
	* Проверка значений заполненных полей
		Тогда элемент формы с именем "Partner" стал равен 'Клиент 2 (2 соглашения)'
		Тогда элемент формы с именем "LegalName" стал равен 'Клиент 2'
		Тогда элемент формы с именем "Agreement" стал равен 'Индивидуальное соглашение 2 (расчет по соглашениям)'
	* Закрытие формы документа
		И я закрываю все окна клиентского приложения