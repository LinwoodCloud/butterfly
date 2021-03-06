// app_module.dart
import 'package:butterfly/pad/module.dart';
import 'package:butterfly/pages/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'settings/module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => HomePage()),
    ModuleRoute('/settings', module: SettingsModule()),
    ModuleRoute('/pad', module: PadModule())
  ];
}
