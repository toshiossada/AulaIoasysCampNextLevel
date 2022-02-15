import '../models/currency_info_model.dart';

abstract class ICurrencyDatasource {
  Future<CurrencyInfoModel> getCurrencies();
}
