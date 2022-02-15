import 'package:flutter_modular/flutter_modular.dart';

class HomeController {
  load() async {
    await Future.delayed(const Duration(seconds: 2));

    Modular.to.navigate('/converter');
  }
}
