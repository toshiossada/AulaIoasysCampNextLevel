import 'package:exemplo_aula/app/modules/converter/domain/entities/currency_info_entity.dart';

import '../../domain/repositories/currency_repository_interface.dart';
import 'datasources/currency_datasource_interface.dart';

class CurrencyRepository extends ICurrencyRepository {
  final ICurrencyDatasource _currencyDatasource;

  CurrencyRepository({required ICurrencyDatasource currencyDatasource})
      : _currencyDatasource = currencyDatasource;

  @override
  Future<CurrencyInfoEntity> getCurrencies() {
    final result = _currencyDatasource.getCurrencies();

    return result;
  }
}
