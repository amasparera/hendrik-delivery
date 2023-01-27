import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../controller/login_controller.dart';
import '../widget/main_button.dart';
import '../widget/main_textfield.dart';
import 'lupa_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    context.read<LoginController>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final co = context.read<LoginController>();

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
                MainTextField(
                  controller: co.emailLogin,
                  hint: "Email atau nomor ponsel",
                  icon: const Icon(
                    Icons.email_outlined,
                    color: Color(0xffBDBDBD),
                  ),
                ),
                const SizedBox(height: 12),
                Consumer<LoginController>(builder: (context, c, _) {
                  return MainTextField(
                    controller: c.passwordLogin,
                    hint: "Password",
                    obscure: c.visibiliti,
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: Color(0xffBDBDBD),
                    ),
                    visibiliti: GestureDetector(
                      onTap: () => c.swithVisibiliti(),
                      child: Icon(
                          c.visibiliti
                              ? Icons.visibility_off_outlined
                              : Icons.visibility,
                          color: const Color(0xffBDBDBD)),
                    ),
                  );
                }),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          toPageCupertino(context, const LupaPassword());
                        },
                        child: const Text("Lupa Password?"))),
                Consumer<LoginController>(builder: (context, c, _) {
                  return MainButton(
                    onPress: () {
                      c.reqLogin == RequestState.empty
                          ? c.login(context)
                          : null;
                    },
                    text: c.reqLogin == RequestState.empty ? "Masuk" : null,
                    symetry: 0,
                    child: c.reqLogin == RequestState.loading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: bg,
                              strokeWidth: 1.5,
                            ),
                          )
                        : null,
                  );
                }),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
