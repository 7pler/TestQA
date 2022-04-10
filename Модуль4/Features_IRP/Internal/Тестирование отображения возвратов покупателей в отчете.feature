#language: ru

@tree
@ТестированиеОтчетов

Функционал: тестирование отображения возвратов в отчете D2001 Продажи

Как тестировщик я хочу
чтобы возвраты покупателей корректно отображались в отчете D2001 Продажи
чтобы убедиться, что менеджер по продажам увидит в отчете корректные данные 

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: тестирование отображения возвратов в отчете D2001 Продажи

Сценарий: проверка заполнения полей документа Заказ покупателя
	* Загрузка тестовых данных
		И экспорт основных данных
		И экспорт документов закупок

	* Проведение закупочных документов, чтобы появились остатки на складе
		И я выполняю код встроенного языка на сервере
			|'Документы.PurchaseInvoice.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.PurchaseInvoice.НайтиПоНомеру("2").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

	* Загрузка и проведение документов SalesInvoice, ShipmentConfirmation и SalesReturn
		// Документ.SalesInvoice

		И я проверяю или создаю для документа "SalesInvoice" объекты:
			| 'Ref'                                                                   | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Agreement'                                                          | 'BasisDocument' | 'Company'                                                           | 'Currency'                                                           | 'DateOfShipment'     | 'LegalName'                                                         | 'Manager' | 'ManagerSegment'                                                          | 'Partner'                                                          | 'PriceIncludeTax' | 'IgnoreAdvances' | 'LegalNameContract' | 'Author'                                                        | 'Branch' | 'Description' | 'DocumentAmount' |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'False'        | 1        | '10.04.2022 18:40:35' | 'True'   | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6868' | ''              | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | '01.01.0001 0:00:00' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | ''        | 'e1cib/data/Catalog.PartnerSegments?ref=b762b13668d0905011eb7663e35d7956' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | 'True'            | 'False'          | ''                  | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            | 18500            |

		И я перезаполняю для объекта табличную часть "ItemList":
			| 'Ref'                                                                   | 'TotalAmount' | 'NetAmount' | 'ItemKey'                                                          | 'Store'                                                          | 'OffersAmount' | 'Price' | 'Quantity' | 'TaxAmount' | 'Key'                                  | 'Unit'                                                          | 'PriceType'                                                          | 'SalesOrder' | 'DeliveryDate'       | 'Detail' | 'ProfitLossCenter' | 'RevenueType' | 'AdditionalAnalytic' | 'DontCalculateRow' | 'QuantityInBaseUnit' | 'UseShipmentConfirmation' |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 9500          | 7916.67     | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb76684b9f687e' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' |                | 190     | 50         | 1583.33     | '7194be0c-961e-408b-b4c9-165743708734' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | ''           | '01.01.0001 0:00:00' | ''       | ''                 | ''            | ''                   | 'False'            | 50                   | 'True'                    |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 9000          | 7500        | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' |                | 450     | 20         | 1500        | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | ''           | '01.01.0001 0:00:00' | ''       | ''                 | ''            | ''                   | 'False'            | 20                   | 'True'                    |

		И я перезаполняю для объекта табличную часть "TaxList":
			| 'Ref'                                                                   | 'Key'                                  | 'Tax'                                                           | 'Analytics' | 'TaxRate'                                                          | 'Amount' | 'IncludeToTotalAmount' | 'ManualAmount' |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '7194be0c-961e-408b-b4c9-165743708734' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 1583.33  | 'True'                 | 1583.33        |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 1500     | 'True'                 | 1500           |

		И я перезаполняю для объекта табличную часть "Currencies":
			| 'Ref'                                                                   | 'Key' | 'CurrencyFrom'                                                       | 'Rate' | 'ReverseRate' | 'ShowReverseRate' | 'Multiplicity' | 'MovementType'                                                                                    | 'Amount' | 'IsFixed' |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 18500    | 'False'   |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 0.859  | 1.1641        | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 15891.5  | 'False'   |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 18500    | 'False'   |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''    | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |        |               | 'False'           |                | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |          | 'False'   |

		И я перезаполняю для объекта табличную часть "RowIDInfo":
			| 'Ref'                                                                   | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis' | 'CurrentStep' | 'NextStep'                                    | 'RowRef'                                                         | 'BasisKey' |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '7194be0c-961e-408b-b4c9-165743708734' | '7194be0c-961e-408b-b4c9-165743708734' | 50         | ''      | ''            | 'e1cib/data/Catalog.MovementRules?refName=SC' | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13ed9' | ''         |
			| 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 20         | ''      | ''            | 'e1cib/data/Catalog.MovementRules?refName=SC' | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13eee' | ''         |

		// Документ.SalesReturn

		И я проверяю или создаю для документа "SalesReturn" объекты:
			| 'Ref'                                                                  | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Agreement'                                                          | 'BaseDocument' | 'Company'                                                           | 'Currency'                                                           | 'DateOfShipment'     | 'LegalName'                                                         | 'ManagerSegment' | 'Partner'                                                          | 'PriceIncludeTax' | 'DueAsAdvance' | 'LegalNameContract' | 'Author'                                                        | 'Branch' | 'Description' | 'DocumentAmount' |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'False'        | 1        | '10.04.2022 18:42:54' | 'True'   | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6868' | ''             | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | '01.01.0001 0:00:00' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | ''               | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | 'True'            | 'False'        | ''                  | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            | 18500            |

		И я перезаполняю для объекта табличную часть "ItemList":
			| 'Ref'                                                                  | 'Key'                                  | 'Cancel' | 'ItemKey'                                                          | 'Store'                                                          | 'NetAmount' | 'OffersAmount' | 'Price' | 'PriceType'                                                          | 'Quantity' | 'TaxAmount' | 'TotalAmount' | 'Unit'                                                          | 'SalesReturnOrder' | 'SalesInvoice'                                                          | 'DontCalculateRow' | 'QuantityInBaseUnit' | 'ProfitLossCenter' | 'RevenueType' | 'AdditionalAnalytic' | 'UseGoodsReceipt' | 'ReturnReason' |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | '39127cff-f0db-45dc-bc2a-9cdc80aaca01' | 'False'  | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb76684b9f687e' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 7916.67     |                | 190     | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | 50         | 1583.33     | 9500          | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | ''                 | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'False'            | 50                   | ''                 | ''            | ''                   | 'True'            | ''             |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'a87904fb-7d28-48ef-bac2-e06905734569' | 'False'  | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 7500        |                | 450     | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | 20         | 1500        | 9000          | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | ''                 | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'False'            | 20                   | ''                 | ''            | ''                   | 'True'            | ''             |

		И я перезаполняю для объекта табличную часть "TaxList":
			| 'Ref'                                                                  | 'Key'                                  | 'Tax'                                                           | 'Amount' | 'Analytics' | 'TaxRate'                                                          | 'IncludeToTotalAmount' | 'ManualAmount' |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | '39127cff-f0db-45dc-bc2a-9cdc80aaca01' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | 1583.33  | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 'True'                 | 1583.33        |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'a87904fb-7d28-48ef-bac2-e06905734569' | 'e1cib/data/Catalog.Taxes?ref=b762b13668d0905011eb7663e35d7970' | 1500     | ''          | 'e1cib/data/Catalog.TaxRates?ref=b762b13668d0905011eb7663e35d796c' | 'True'                 | 1500           |

		И я перезаполняю для объекта табличную часть "Currencies":
			| 'Ref'                                                                  | 'CurrencyFrom'                                                       | 'Rate' | 'ReverseRate' | 'ShowReverseRate' | 'Multiplicity' | 'Key' | 'MovementType'                                                                                    | 'Amount' | 'IsFixed' |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 18500    | 'False'   |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 0.859  | 1.1641        | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796a' | 15891.5  | 'False'   |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 1      | 1             | 'False'           | 1              | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7968' | 18500    | 'False'   |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' |        |               | 'False'           |                | ''    | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d7969' |          | 'False'   |

		И я перезаполняю для объекта табличную часть "RowIDInfo":
			| 'Ref'                                                                  | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis'                                                                 | 'CurrentStep'                                     | 'NextStep'                                    | 'RowRef'                                                         | 'BasisKey'                             |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | '39127cff-f0db-45dc-bc2a-9cdc80aaca01' | '7194be0c-961e-408b-b4c9-165743708734' | 50         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'e1cib/data/Catalog.MovementRules?refName=SRO_SR' | 'e1cib/data/Catalog.MovementRules?refName=GR' | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13ed9' | '7194be0c-961e-408b-b4c9-165743708734' |
			| 'e1cib/data/Document.SalesReturn?ref=be5cb4a9fc6b51e411ecb8dc2df13ef1' | 'a87904fb-7d28-48ef-bac2-e06905734569' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 20         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'e1cib/data/Catalog.MovementRules?refName=SRO_SR' | 'e1cib/data/Catalog.MovementRules?refName=GR' | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13eee' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' |

		// Документ.ShipmentConfirmation

		И я проверяю или создаю для документа "ShipmentConfirmation" объекты:
			| 'Ref'                                                                           | 'DeletionMark' | 'Number' | 'Date'                | 'Posted' | 'Company'                                                           | 'LegalName'                                                         | 'Partner'                                                          | 'TransactionType'                                 | 'Author'                                                        | 'Branch' | 'Description' |
			| 'e1cib/data/Document.ShipmentConfirmation?ref=be5cb4a9fc6b51e411ecb8dc2df13ef0' | 'False'        | 1        | '10.04.2022 18:42:34' | 'True'   | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | 'Enum.ShipmentConfirmationTransactionTypes.Sales' | 'e1cib/data/Catalog.Users?ref=aa7f120ed92fbced11eb13d7279770c0' | ''       | ''            |

		И я перезаполняю для объекта табличную часть "ItemList":
			| 'Ref'                                                                           | 'Key'                                  | 'ItemKey'                                                          | 'Store'                                                          | 'Unit'                                                          | 'Quantity' | 'ShipmentBasis'                                                         | 'QuantityInBaseUnit' | 'SalesOrder' | 'SalesInvoice'                                                          | 'InventoryTransferOrder' | 'InventoryTransfer' | 'PurchaseReturnOrder' | 'PurchaseReturn' |
			| 'e1cib/data/Document.ShipmentConfirmation?ref=be5cb4a9fc6b51e411ecb8dc2df13ef0' | '171dc97d-efc9-4c16-b153-080581ea3231' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb76684b9f687e' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 50         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 50                   | ''           | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''                       | ''                  | ''                    | ''               |
			| 'e1cib/data/Document.ShipmentConfirmation?ref=be5cb4a9fc6b51e411ecb8dc2df13ef0' | '0e43d880-7dcd-4f8e-81b4-e78d544e9983' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 20         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 20                   | ''           | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | ''                       | ''                  | ''                    | ''               |

		И я перезаполняю для объекта табличную часть "RowIDInfo":
			| 'Ref'                                                                           | 'Key'                                  | 'RowID'                                | 'Quantity' | 'Basis'                                                                 | 'CurrentStep'                                 | 'NextStep' | 'RowRef'                                                         | 'BasisKey'                             |
			| 'e1cib/data/Document.ShipmentConfirmation?ref=be5cb4a9fc6b51e411ecb8dc2df13ef0' | '171dc97d-efc9-4c16-b153-080581ea3231' | '7194be0c-961e-408b-b4c9-165743708734' | 50         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'e1cib/data/Catalog.MovementRules?refName=SC' | ''         | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13ed9' | '7194be0c-961e-408b-b4c9-165743708734' |
			| 'e1cib/data/Document.ShipmentConfirmation?ref=be5cb4a9fc6b51e411ecb8dc2df13ef0' | '0e43d880-7dcd-4f8e-81b4-e78d544e9983' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 20         | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | 'e1cib/data/Catalog.MovementRules?refName=SC' | ''         | 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13eee' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' |

		И я проверяю или создаю для справочника "RowIDs" объекты:
			| 'Ref'                                                            | 'DeletionMark' | 'Code' | 'Description'                          | 'AgreementSales'                                                     | 'Company'                                                           | 'CurrencySales'                                                      | 'LegalNameSales'                                                    | 'PartnerSales'                                                     | 'PriceIncludeTaxSales' | 'Store'                                                          | 'Unit'                                                          | 'ItemKey'                                                          | 'Branch' | 'Basis'                                                                 | 'RowID'                                | 'ProcurementMethod' | 'StoreSender' | 'StoreReceiver' | 'TransactionTypeSC'                               | 'TransactionTypeGR'                                    | 'TransactionType'                                 | 'Requester' | 'AgreementPurchases' | 'PartnerPurchases' | 'LegalNamePurchases' | 'PriceIncludeTaxPurchases' | 'CurrencyPurchases' |
			| 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13ed9' | 'False'        | 1      | '7194be0c-961e-408b-b4c9-165743708734' | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6868' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | 'True'                 | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb76684b9f687e' | ''       | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '7194be0c-961e-408b-b4c9-165743708734' | ''                  | ''            | ''              | 'Enum.ShipmentConfirmationTransactionTypes.Sales' | 'Enum.GoodsReceiptTransactionTypes.ReturnFromCustomer' | 'Enum.ShipmentConfirmationTransactionTypes.Sales' | ''          | ''                   | ''                 | ''                   | 'False'                    | ''                  |
			| 'e1cib/data/Catalog.RowIDs?ref=be5cb4a9fc6b51e411ecb8dc2df13eee' | 'False'        | 2      | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | 'e1cib/data/Catalog.Agreements?ref=b762b13668d0905011eb76684b9f6868' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7663e35d7964' | 'e1cib/data/Catalog.Currencies?ref=b762b13668d0905011eb7663e35d795e' | 'e1cib/data/Catalog.Companies?ref=b762b13668d0905011eb7674324a4a2c' | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794c' | 'True'                 | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'e1cib/data/Catalog.Units?ref=b762b13668d0905011eb76684b9f687b' | 'e1cib/data/Catalog.ItemKeys?ref=b762b13668d0905011eb766bf96b2751' | ''       | 'e1cib/data/Document.SalesInvoice?ref=be5cb4a9fc6b51e411ecb8dc2df13eef' | '92ae1ec5-6238-4f80-8a78-503dc2c4d52e' | ''                  | ''            | ''              | 'Enum.ShipmentConfirmationTransactionTypes.Sales' | 'Enum.GoodsReceiptTransactionTypes.ReturnFromCustomer' | 'Enum.ShipmentConfirmationTransactionTypes.Sales' | ''          | ''                   | ''                 | ''                   | 'False'                    | ''                  |

		//проведем загруженные документы
		И я выполняю код встроенного языка на сервере
			|'Документы.SalesInvoice.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.ShipmentConfirmation.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
			|'Документы.SalesReturn.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

	* Проверка сведений в отчете D2001 с проведенным возвратом покупателя
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		Когда открылось окно 'D2001 Продажи'
		//установим период в настройках отчета, чтобы наши загруженные документы точно попали в период отчета
		И я нажимаю на кнопку с именем 'FormChangeVariant'
		И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
			| 'Параметр' |
			| 'Период'   |
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersStartDate' я ввожу текст '01.04.2022  0:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersEndDate' я ввожу текст '30.04.2022 23:59:59'
		И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormEndEdit'
		И я нажимаю на кнопку с именем 'FormGenerate'
		Дано Табличный документ "Result" равен макету "ОтчетСВозвратом"
		//убедимся, что наш отбор по периоду применился
		И в табличном документе "Result" ячейка с адресом "R2C2" равна "Период: 01.04.2022 - 30.04.2022"
			
	* Отменим проведение возврата покупателя
		//проверим, что если возврат распровести, сведения о продаже отобразятся в отчете
		И я выполняю код встроенного языка на сервере
			|'Документы.SalesReturn.НайтиПоНомеру("1").ПолучитьОбъект().Записать(РежимЗаписиДокумента.ОтменаПроведения);'|

	* Проверка сведений в отчете D2001 без возврата покупателя
		И я нажимаю на кнопку с именем 'FormGenerate'
		Дано Табличный документ "Result" равен макету "ОтчетБезВозврата"
		И в табличном документе "Result" ячейка с адресом "R13C2" равна "70,000"

	* Закрытие окон	
		И я закрываю все окна клиентского приложения		