import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../controller/login_controller.dart';
import '../widget/cek_karakter.dart';
import '../widget/main_button.dart';
import '../widget/main_textfield.dart';

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
          Consumer<LoginController>(builder: (context, c, _) {
            return MainTextField(
              onChange: (value) => c.readPass(),
              controller: c.aturUlangSandi,
              hint: "Password",
              obscure: c.visibilitiAturUlang,
              icon: const Icon(
                Icons.lock_outline_rounded,
                color: Color(0xffBDBDBD),
              ),
              visibiliti: GestureDetector(
                onTap: () => c.swithVisibilitiAturUlang(),
                child: Icon(
                    c.visibilitiAturUlang
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    color: const Color(0xffBDBDBD)),
              ),
            );
          }),
          const SizedBox(height: 8),
          Consumer<LoginController>(builder: (context, c, _) {
            return MainTextField(
              onChange: (value) => c.readPass(),
              controller: c.aturUlangSandi2,
              hint: "Password",
              obscure: c.visibilitiAturUlang,
              icon: const Icon(
                Icons.lock_outline_rounded,
                color: Color(0xffBDBDBD),
              ),
              visibiliti: GestureDetector(
                onTap: () => c.swithVisibilitiAturUlang(),
                child: Icon(
                    c.visibilitiAturUlang
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    color: const Color(0xffBDBDBD)),
              ),
            );
          }),
          const SizedBox(height: 16),
          Consumer<LoginController>(builder: (context, c, _) {
            return c.openPass2
                ? Column(
                    children: [
                      CekCharakter(
                        fill: c.hasMinLength2,
                        text: "Memiliki 8 charakter",
                      ),
                      CekCharakter(
                        fill: c.hasUppercase2,
                        text: "Memiliki Setidaknya 1 karakter kapital",
                      ),
                      CekCharakter(
                        fill: c.hasSpecialCharacters2,
                        text: "Memiliki karakter unik seperti ~!@#\$%^&*().",
                      ),
                      CekCharakter(
                        fill: c.hasDigits2,
                        text: "Memiliki karakter numerik",
                      ),
                      CekCharakter(
                        fill: c.aturUlangSandi.text == c.aturUlangSandi2.text,
                        text: "password harus sama",
                      ),
                    ],
                  )
                : const SizedBox();
          }),
          const SizedBox(height: 18),
          Consumer<LoginController>(
            builder: (context, c, _) {
              return MainButton(
                onPress: () {
                  c.reqKirimUlang == RequestState.empty
                      ? c.updateSandi(context)
                      : null;
                },
                text: c.reqKirimUlang == RequestState.empty ? "Kirim" : null,
                symetry: 0,
                child: c.reqKirimUlang == RequestState.loading
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
        ],
      ),
    );
  }
}
