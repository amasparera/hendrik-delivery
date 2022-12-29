import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../widget/main_button.dart';
import '../widget/otp_form.dart';
import 'atur_ulang_view.dart';

class VerifikasiPasswordView extends StatelessWidget {
  const VerifikasiPasswordView({super.key});

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
            "Masukkan\nkode verifikasi",
            style: mainStyle,
          ),
          const SizedBox(height: 16),
          const OtpForm(),
          const SizedBox(height: 12),
          const Text(
            "04.32",
            style: TextStyle(color: fontPurple, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: RichText(
                text: const TextSpan(
                    text: "4 digit kode telah dikirimkan ke emailmu ",
                    style: TextStyle(color: fontBlack),
                    children: [
                  TextSpan(
                      text: "jo******@email.com. ",
                      style: TextStyle(color: fontPurple)),
                  TextSpan(text: "Silakan cek kotak masuk kamu")
                ])),
          ),
          GestureDetector(
              child: const Text(
            "Saya tidak menerima kode? Kirim ulang",
            style: TextStyle(color: Colors.lightBlue),
          )),
          const SizedBox(
            height: padding,
          ),
          MainButton(
            onPress: () {
              toPageCupertino(context, const AturUlangView());
            },
            text: "Kirim",
            symetry: 0,
          )
        ],
      ),
    );
  }
}
