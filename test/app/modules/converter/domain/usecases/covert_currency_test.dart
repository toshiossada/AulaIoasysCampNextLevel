import 'package:exemplo_aula/app/modules/converter/domain/entities/currency_info_entity.dart';
import 'package:exemplo_aula/app/modules/converter/domain/enums/currency_type_enum.dart';
import 'package:exemplo_aula/app/modules/converter/domain/errors/errors.dart';
import 'package:exemplo_aula/app/modules/converter/domain/repositories/currency_repository_interface.dart';
import 'package:exemplo_aula/app/modules/converter/domain/usecases/covert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'covert_currency_test.mocks.dart';

@GenerateMocks([ICurrencyRepository])
void main() {
  late ConvertCurrency _usecase;
  final _currencyRepository = MockICurrencyRepository();

  setUp(() {
    _usecase = ConvertCurrency(
      currencyRepository: _currencyRepository,
    );
  });

  group('Testes de dolares', () {
    test('''
    Dado o valor de 4 dolares
    Quando retornar a cotação do dolar de 6 reais e o euro 8 reais
    Então deve calcular 24 reais, 3 euros e 4 dolares
  ''', () async {
      //AAA
      //arrange
      const value = '4';
      const type = CurrencyTypeEnum.usd;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 6, euro: 8),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 24);
      expect(result.dolar, 4);
      expect(result.euro, 3);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });
  group('Testes de euros', () {
    test('''
    Dado o valor de 4 eurous
    Quando retornar a cotação do dolar de 2 reais e o euro 4 reais
    Então deve calcular 16 reais, 4 euros e 8 dolares
  ''', () async {
      //AAA
      //arrange
      const value = '4';
      const type = CurrencyTypeEnum.eur;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 2, euro: 4),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 16);
      expect(result.dolar, 8);
      expect(result.euro, 4);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });
  group('Testes de reais', () {
    test('''
    Dado o valor de 10 reais
    Quando retornar a cotação do dolar de 5 reais e o euro 10 reais
    Então deve calcular 10 reais, 1 euro e 2 dolares
  ''', () async {
      //AAA
      //arrange
      const value = '10';
      const type = CurrencyTypeEnum.brl;
      when(_currencyRepository.getCurrencies()).thenAnswer(
        (_) async => CurrencyInfoEntity(dolar: 5, euro: 10),
      );

      //act
      final result = await _usecase(value, type);

      //assert
      expect(result.real, 10);
      expect(result.dolar, 2);
      expect(result.euro, 1);
      verify(_currencyRepository.getCurrencies()).called(1);
    });
  });

  group('Testes de Excessões', () {
    test('''
    Dado um valor em reais
    Quando o valor for vazio
    Então deve disparar uma exceção
  ''', () async {
      //AAA
      //arrange
      const value = '';
      const type = CurrencyTypeEnum.brl;

      //act
      final result = _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueIsEmptyError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });

    test('''
    Dado um valor em reais
    Quando o valor não for um numero
    Então deve disparar uma exceção
  ''', () async {
      //AAA
      //arrange
      const value = 'abobrinhas voadoras';
      const type = CurrencyTypeEnum.brl;

      //act
      final result = _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueNotNumberError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });

    test('''
    Dado um valor em reais
    Quando o valor for negativo
    Então deve disparar uma exceção
  ''', () async {
      //AAA
      //arrange
      const value = '-20';
      const type = CurrencyTypeEnum.brl;

      //act
      final result = _usecase(value, type);

      //assert
      expect(result, throwsA(isA<ValueNegativeError>()));
      verifyNever(_currencyRepository.getCurrencies());
    });
  });
}
