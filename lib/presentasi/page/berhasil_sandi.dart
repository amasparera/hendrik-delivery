import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../controller/login_controller.dart';
import '../widget/main_button.dart';

class BerhasilSandi extends StatelessWidget {
  const BerhasilSandi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: padding * 2,
            ),
            FadeInDown(
                duration: const Duration(milliseconds: 450),
                child: Image.asset("assets/image/Hands Unlocked.png")),
            FadeInDown(
              duration: const Duration(milliseconds: 450),
              child: const Padding(
                padding: EdgeInsets.only(top: padding * 2, bottom: 12),
                child: Text(
                  "Yay, Berhasil!",
                  style: mainStyle,
                ),
              ),
            ),
            Consumer<LoginController>(builder: (context, c, _) {
              return FadeInDown(
                  duration: const Duration(milliseconds: 450),
                  child: Text(c.pesanView));
            }),
            const SizedBox(
              height: padding * 2,
            ),
            FadeIn(
              duration: const Duration(milliseconds: 900),
              delay: const Duration(milliseconds: 450),
              child: MainButton(
                onPress: () {
                  context.read<LoginController>().masuk(context);
                },
                text: "Masuk",
                symetry: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
