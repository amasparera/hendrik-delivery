import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../widget/main_textfield.dart';
import '../widget/main_button.dart';
import 'verifikasi_password_view.dart';

class LupaPassword extends StatelessWidget {
  const LupaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: fontBlack,
            ),
            onPressed: () => closePage(context),
          )),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        children: [
          const SizedBox(height: 34),
          Image.asset(
            "assets/image/Hands Tiny Lock.png",
            height: 240,
          ),
          const SizedBox(height: padding),
          const Text(
            "Lupa\npassword?",
            style: mainStyle,
          ),
          const SizedBox(height: 8),
          const Text(
              "Masukkan e-mail yang terdaftar. Kami akan mengirimkan kode verifikasi untuk kamu, atur ulang sandi"),
          const SizedBox(height: padding),
          const MainTextField(
            hint: "Email atau nomor ponsel",
            icon: Icon(
              Icons.email_outlined,
              color: Color(0xffBDBDBD),
            ),
          ),
          const SizedBox(height: padding * 2),
          MainButton(
            onPress: () {
              toPageCupertino(context, const VerifikasiPasswordView());
            },
            text: "Lanjut",
            symetry: 0,
          ),
          const SizedBox(height: padding),
        ],
      ),
    );
  }
}
