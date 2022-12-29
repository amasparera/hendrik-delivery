import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
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
            FadeInDown(
                duration: const Duration(milliseconds: 450),
                child: const Text("Password kamu berhasil diganti")),
            const SizedBox(
              height: padding * 2,
            ),
            FadeIn(
              duration: const Duration(milliseconds: 900),
              delay: const Duration(milliseconds: 450),
              child: MainButton(
                onPress: () {},
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
