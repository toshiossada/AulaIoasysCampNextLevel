import 'package:exemplo_aula/app/modules/converter/infra/repositories/models/currency_info_model.dart';

import '../../../../../commons/adapters/http_client/http_client_adapter.dart';
import '../repositories/datasources/currency_datasource_interface.dart';

class CurrencyDatasource extends ICurrencyDatasource {
  final IHttpClientAdapter _httpClient;

  CurrencyDatasource({required IHttpClientAdapter httpClient})
      : _httpClient = httpClient;

  @override
  Future<CurrencyInfoModel> getCurrencies() async {
    final response =
        await _httpClient.get('/finance', queryParameters: {'format': 'json'});
    var result = CurrencyInfoModel.fromJson(response.data);
    return result;
  }
}
