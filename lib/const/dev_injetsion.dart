import 'package:e_kantin_delivery/presentasi/controller/home_controller.dart';
import 'package:e_kantin_delivery/presentasi/controller/login_controller.dart';
import 'package:e_kantin_delivery/presentasi/controller/profile_controller.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> register() async {
  locator.registerFactory<HomeController>(() => HomeController());
  locator.registerFactory<LoginController>(() => LoginController());
  locator.registerFactory<ProfileController>(() => ProfileController());
}
