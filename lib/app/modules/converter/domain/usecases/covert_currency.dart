import '../entities/currency_entity.dart';
import '../enums/currency_type_enum.dart';
import '../errors/errors.dart';
import '../repositories/currency_repository_interface.dart';

abstract class IConvertCurrency {
  Future<CurrencyEntity> call(String value, CurrencyTypeEnum type);
}

class ConvertCurrency extends IConvertCurrency {
  final ICurrencyRepository _currencyRepository;

  ConvertCurrency({
    required ICurrencyRepository currencyRepository,
  }) : _currencyRepository = currencyRepository;

  @override
  Future<CurrencyEntity> call(String value, CurrencyTypeEnum type) async {
    if (value.isEmpty) {
      throw ValueIsEmptyError();
    } else if (double.tryParse(value) == null) {
      throw ValueNotNumberError();
    } else if (double.parse(value) < 0) {
      throw ValueNegativeError();
    }

    var convertedValue = double.parse(value);

    var currencies = await _currencyRepository.getCurrencies();

    switch (type) {
      case CurrencyTypeEnum.brl:
        return CurrencyEntity(
          dolar: convertedValue / currencies.dolar,
          euro: convertedValue / currencies.euro,
          real: convertedValue,
        );
      case CurrencyTypeEnum.usd:
        var realValue = convertedValue * currencies.dolar;
        return CurrencyEntity(
          dolar: convertedValue,
          euro: realValue / currencies.euro,
          real: realValue,
        );
      case CurrencyTypeEnum.eur:
        var realValue = convertedValue * currencies.euro;
        return CurrencyEntity(
          dolar: realValue / currencies.dolar,
          euro: currencies.euro,
          real: realValue,
        );
    }
  }
}
