import 'package:the_blackbridge_group/screens/formpage/view/formpage.dart';
import 'package:the_blackbridge_group/screens/login/view/login.dart';
import 'package:the_blackbridge_group/screens/registeration/view/registeration.dart';
import 'package:the_blackbridge_group/screens/registeration/view/registeration2.dart';

import '../widgets/widgets_imports.dart';

dynamic routes = [
  GetPage(name: '/', page: () => const Home()),
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/registeration', page: () => Registeration()),
  GetPage(name: '/Registeration2', page: () => Registeration2()),
  GetPage(name: '/formpage', page: () => FormPage()),
];
