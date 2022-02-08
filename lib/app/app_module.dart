import 'package:exemplo_aula/app/modules/converter/converter_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: ConverterModule()),
      ];
}
