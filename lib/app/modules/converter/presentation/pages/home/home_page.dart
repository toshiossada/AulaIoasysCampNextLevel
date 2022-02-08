import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'home_controller.dart';
import 'widgets/currency_input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: Text('title_converter'.i18n()),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          children: [
            Icon(
              Icons.attach_money,
              size: MediaQuery.of(context).size.height * .18,
            ),
            CurencyInputText(
              controller: controller.realController,
              hintText: 'brl'.i18n(),
              prefix: 'brl_symbol'.i18n(),
              onChanged: controller.onRealChanged,
            ),
            CurencyInputText(
              controller: controller.dolarController,
              hintText: 'usd'.i18n(),
              prefix: 'usd_symbol'.i18n(),
              onChanged: controller.onDolarChanged,
            ),
            CurencyInputText(
              controller: controller.euroController,
              hintText: 'eur'.i18n(),
              prefix: 'eur_symbol'.i18n(),
              onChanged: controller.onEuroChanged,
            ),
          ],
        ),
      ),
    );
  }
}
