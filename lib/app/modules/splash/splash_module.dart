import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home/home_controller.dart';
import 'presentation/home/home_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeController(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
