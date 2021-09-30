import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple_poc/app/service/shared_preferences_service.dart';

import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => SharedPreferencesService()),
    //Store
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
