import 'package:exemplo_aula/app/modules/converter/infra/datasources/currency_datasource.dart';
import 'package:exemplo_aula/app/modules/converter/infra/repositories/models/currency_info_model.dart';
import 'package:exemplo_aula/commons/adapters/http_client/http_client_adapter.dart';
import 'package:exemplo_aula/commons/adapters/http_client/http_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../utils/mocks/currency_mocks.dart';
import 'currency_datasource_test.mocks.dart';

@GenerateMocks([IHttpClientAdapter])
void main() {
  late CurrencyDatasource _dataSource;
  final _http = MockIHttpClientAdapter();

  setUp(() {
    _dataSource = CurrencyDatasource(httpClient: _http);
  });

  test('currency datasource ...', () async {
    when(_http.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
            (_) async => HttpResponse(statusCode: 200, data: responsePayload));

    var result = await _dataSource.getCurrencies();

    expect(result, isA<CurrencyInfoModel>());
    expect(result.euro, 5.8879);
    expect(result.dolar, 5.1835);
  });
}
