import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../controller/login_controller.dart';
import '../widget/main_button.dart';
import '../widget/main_textfield.dart';

class LupaPassword extends StatelessWidget {
  const LupaPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final co = context.read<LoginController>();
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
          MainTextField(
            controller: co.emailLupaPassword,
            hint: "Email atau nomor ponsel",
            icon: const Icon(
              Icons.email_outlined,
              color: Color(0xffBDBDBD),
            ),
          ),
          const SizedBox(height: padding * 2),
          Consumer<LoginController>(
            builder: (context, c, _) {
              return MainButton(
                onPress: () {
                  c.reqLupaPassword == RequestState.empty
                      ? c.lupaPassword(context)
                      : null;
                },
                text: c.reqLupaPassword == RequestState.empty ? "Lanjut" : null,
                symetry: 0,
                child: c.reqLupaPassword == RequestState.loading
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
            },
          ),
          const SizedBox(height: padding),
        ],
      ),
    );
  }
}
