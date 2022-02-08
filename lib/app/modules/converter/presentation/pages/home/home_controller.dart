import 'package:flutter/material.dart';

import '../../../domain/enums/currency_type_enum.dart';
import 'home_store.dart';

class HomeController {
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final HomeStore homeStore;

  HomeController({
    required this.homeStore,
  });

  search(CurrencytypeEnum currencyType) {
    homeStore.setLoading(true);
    //Faz alguma coisa

    if (currencyType != CurrencytypeEnum.brl) realController.text = '1.00';
    if (currencyType != CurrencytypeEnum.usd) dolarController.text = '1.00';
    if (currencyType != CurrencytypeEnum.eur) euroController.text = '1.00';

    homeStore.setLoading(false);
  }

  onRealChanged(String value) {
    search(CurrencytypeEnum.brl);
  }

  onDolarChanged(String value) {
    search(CurrencytypeEnum.usd);
  }

  onEuroChanged(String value) {
    search(CurrencytypeEnum.eur);
  }
}
