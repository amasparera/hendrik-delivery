import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';

class PanggilanView extends StatefulWidget {
  const PanggilanView({super.key});

  @override
  State<PanggilanView> createState() => _PanggilanViewState();
}

class _PanggilanViewState extends State<PanggilanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(person),
        ),
        const Padding(
          padding: EdgeInsets.only(top: padding, bottom: 12),
          child: Text(
            "Jade Filter",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          "Office boy",
          style: TextStyle(fontSize: 13),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: padding, top: padding * 3),
          child: Image.asset(
            "assets/icon/Group 48.png",
            width: 34,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icon/Frame 531.png",
                  width: 50,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Tolak",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icon/Frame 530 (1).png",
                  width: 50,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Terima",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )
      ],
    ));
  }
}
