import 'dart:async';

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
  Timer? _debounce;

  HomeController({
    required this.homeStore,
    required IConvertCurrency convertCurrency,
  }) : _convertCurrency = convertCurrency;

  search(CurrencyTypeEnum currencyType, String value) async {
    homeStore.setLoading(true);
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(microseconds: 1000), () async {
      var result = await _convertCurrency(value, currencyType);

      if (currencyType != CurrencyTypeEnum.brl) {
        realController.text = result.realFormated;
      }
      if (currencyType != CurrencyTypeEnum.usd) {
        dolarController.text = result.dolarFormated;
      }
      if (currencyType != CurrencyTypeEnum.eur) {
        euroController.text = result.euroFormated;
      }

      homeStore.setLoading(false);
    });
  }

  onRealChanged(String value) {
    search(CurrencyTypeEnum.brl, realController.text);
  }

  onDolarChanged(String value) {
    search(CurrencyTypeEnum.usd, dolarController.text);
  }

  onEuroChanged(String value) {
    search(CurrencyTypeEnum.eur, euroController.text);
  }
}
