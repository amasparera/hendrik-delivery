import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../controller/login_controller.dart';
import '../widget/main_button.dart';
import '../widget/otp_form.dart';

class VerifikasiPasswordView extends StatelessWidget {
  const VerifikasiPasswordView({super.key});

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
        padding: const EdgeInsets.all(padding),
        children: [
          const Text(
            "Masukkan\nkode verifikasi",
            style: mainStyle,
          ),
          const SizedBox(height: 16),
          const OtpForm(),
          const SizedBox(height: 12),
          Consumer<LoginController>(builder: (context, c, _) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Builder(builder: (context) {
                return c.reqLupaPassword == RequestState.empty
                    ? TweenAnimationBuilder<Duration>(
                        duration: c.expired,
                        tween: Tween(begin: c.expired, end: Duration.zero),
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final minutes = value.inMinutes;
                          final seconds = value.inSeconds % 60;
                          return Text(
                              '${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: fontPurple,
                                  fontWeight: FontWeight.bold));
                        })
                    : const SizedBox();
              }),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: RichText(
                text: TextSpan(
                    text: "4 digit kode telah dikirimkan ke emailmu ",
                    style: const TextStyle(color: fontBlack),
                    children: [
                  TextSpan(
                      text:
                          co.emailLupaPassword.text.replaceRange(1, 4, "****"),
                      style: const TextStyle(color: fontPurple)),
                  const TextSpan(text: ". Silakan cek kotak masuk kamu")
                ])),
          ),
          Consumer<LoginController>(builder: (context, c, _) {
            return c.reqLupaPassword == RequestState.empty
                ? GestureDetector(
                    onTap: () => co.kirimUlang(context),
                    child: const Text(
                      "Saya tidak menerima kode? Kirim ulang",
                      style: TextStyle(color: Colors.lightBlue),
                    ))
                : const LinearProgressIndicator(
                    color: purple,
                  );
          }),
          const SizedBox(
            height: padding,
          ),
          Consumer<LoginController>(
            builder: (context, c, _) {
              return MainButton(
                onPress: () {
                  c.reqVerifikasi == RequestState.empty
                      ? c.verifikasi(context)
                      : null;
                },
                text: c.reqVerifikasi == RequestState.empty ? "Kirim" : null,
                symetry: 0,
                child: c.reqVerifikasi == RequestState.loading
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
