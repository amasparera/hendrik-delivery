import 'package:e_kantin_delivery/const/local_data.dart';
import 'package:e_kantin_delivery/presentasi/controller/home_controller.dart';
import 'package:e_kantin_delivery/presentasi/page/home_view.dart';
import 'package:e_kantin_delivery/presentasi/page/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'const/main_app.dart';
import 'const/dev_injetsion.dart' as dev;
import 'presentasi/controller/login_controller.dart';
import 'presentasi/controller/profile_controller.dart';

// disini banyak yg baru
// belajar rebase ok
// rebase gagal

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  await dev.register();
  final home = await LocalData().loadToken();
  runApp(MyApp(home: home));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.home});

  final String? home;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => dev.locator<HomeController>()),
        ChangeNotifierProvider(create: (_) => dev.locator<LoginController>()),
        ChangeNotifierProvider(create: (_) => dev.locator<ProfileController>())
      ],
      child: MaterialApp(
          title: "E-Kantin Delivery",
          debugShowCheckedModeBanner: false,
          home: home != null ? const HomeView() : const LoginView(),
          locale: const Locale('id', 'ID'),
          theme: ThemeData.light().copyWith(
              primaryColor: purple,
              textTheme: GoogleFonts.interTextTheme(),
              backgroundColor: bg,
              appBarTheme: const AppBarTheme(
                  backgroundColor: bg,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.transparent,
                      statusBarIconBrightness: Brightness.dark,
                      systemNavigationBarColor: Colors.transparent,
                      systemNavigationBarIconBrightness: Brightness.dark)))),
    );
  }
}
