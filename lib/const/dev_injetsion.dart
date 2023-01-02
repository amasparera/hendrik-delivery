import 'package:e_kantin_delivery/presentasi/controller/home_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> register() async {
  locator.registerFactory<HomeController>(() => HomeController());
}
