import 'package:animate_do/animate_do.dart';
import 'package:e_kantin_delivery/presentasi/page/home_view.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../widget/main_button.dart';
import '../widget/main_textfield.dart';
import 'lupa_password_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                Image.asset(
                  "assets/image/Wavy Buddies Delivering.png",
                  scale: 4,
                ),
                const SizedBox(height: padding),
                const Text(
                  "MASUK",
                  style: mainStyle,
                ),
                const Text("Hai, Selamat Datang!"),
                const SizedBox(height: 24),
                const MainTextField(
                  hint: "Email atau nomor ponsel",
                  icon: Icon(
                    Icons.email_outlined,
                    color: Color(0xffBDBDBD),
                  ),
                ),
                const SizedBox(height: 12),
                const MainTextField(
                  hint: "Password",
                  obscure: true,
                  icon: Icon(
                    Icons.lock_outline_rounded,
                    color: Color(0xffBDBDBD),
                  ),
                  visibiliti: Icon(Icons.visibility_off_outlined,
                      color: Color(0xffBDBDBD)),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          toPageCupertino(context, const LupaPassword());
                        },
                        child: const Text("Lupa Password?"))),
                MainButton(
                  onPress: () {
                    toPage(context, const HomeView());
                  },
                  text: "Masuk",
                  symetry: 0,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
