import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../widget/cek_karakter.dart';
import '../widget/main_button.dart';
import '../widget/main_textfield.dart';
import 'berhasil_sandi.dart';

class AturUlangView extends StatelessWidget {
  const AturUlangView({super.key});

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
        padding: const EdgeInsets.all(padding),
        children: [
          const Text(
            "Atur ulang sandi",
            style: mainStyle,
          ),
          const SizedBox(height: 8),
          const MainTextField(
            hint: "Password",
            obscure: true,
            icon: Icon(
              Icons.lock_outline_rounded,
              color: Color(0xffBDBDBD),
            ),
            visibiliti:
                Icon(Icons.visibility_off_outlined, color: Color(0xffBDBDBD)),
          ),
          const SizedBox(height: 8),
          const MainTextField(
            hint: "Password",
            obscure: true,
            icon: Icon(
              Icons.lock_outline_rounded,
              color: Color(0xffBDBDBD),
            ),
            visibiliti:
                Icon(Icons.visibility_off_outlined, color: Color(0xffBDBDBD)),
          ),
          const SizedBox(height: 16),
          const CekCharakter(
            fill: true,
            text: "Memiliki 8 charakter",
          ),
          const CekCharakter(
            fill: false,
            text: "Memiliki Setidaknya 1 karakter kapital",
          ),
          const CekCharakter(
            fill: false,
            text: "Memiliki karakter unik seperti ~!@#\$%^&*().",
          ),
          const CekCharakter(
            fill: false,
            text: "Memiliki karakter numerik",
          ),
          const SizedBox(height: 18),
          MainButton(
            onPress: () {
              toPage(context, const BerhasilSandi());
            },
            text: "Kirim",
            symetry: 0,
          )
        ],
      ),
    );
  }
}
