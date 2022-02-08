import 'package:exemplo_aula/app/modules/converter/presentation/pages/home/home_controller.dart';
import 'package:exemplo_aula/app/modules/converter/presentation/pages/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/home/home_page.dart';

class ConverterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeStore()),
        Bind.factory((i) => HomeController(homeStore: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
