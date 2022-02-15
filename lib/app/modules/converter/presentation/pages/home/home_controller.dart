import 'package:flutter/material.dart';

import '../../../domain/enums/currency_type_enum.dart';
import '../../../domain/usecases/covert_currency.dart';
import 'home_store.dart';

class HomeController {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final HomeStore homeStore;
  final IConvertCurrency _convertCurrency;

  HomeController({
    required this.homeStore,
    required IConvertCurrency convertCurrency,
  }) : _convertCurrency = convertCurrency;

  search(CurrencyTypeEnum currencyType) {
    homeStore.setLoading(true);
    //Faz alguma coisa

    if (currencyType != CurrencyTypeEnum.brl) realController.text = '1.00';
    if (currencyType != CurrencyTypeEnum.usd) dolarController.text = '1.00';
    if (currencyType != CurrencyTypeEnum.eur) euroController.text = '1.00';

    homeStore.setLoading(false);
  }

  onRealChanged(String value) {
    search(CurrencyTypeEnum.brl);
  }

  onDolarChanged(String value) {
    search(CurrencyTypeEnum.usd);
  }

  onEuroChanged(String value) {
    search(CurrencyTypeEnum.eur);
  }
}
