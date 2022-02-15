import 'package:exemplo_aula/app/modules/converter/domain/entities/currency_info_entity.dart';

class CurrencyInfoModel extends CurrencyInfoEntity {
  CurrencyInfoModel({
    required double dolar,
    required double euro,
  }) : super(
          dolar: dolar,
          euro: euro,
        );

  factory CurrencyInfoModel.fromJson(Map<String, dynamic> json) {
    var currencies = json['results']['currencies'];
    return CurrencyInfoModel(
        dolar: currencies['USD']['buy'], euro: currencies['EUR']['buy']);
  }
}
