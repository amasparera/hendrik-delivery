import 'package:flutter/material.dart';

import '../../const/main_app.dart';

class CekCharakter extends StatelessWidget {
  const CekCharakter({
    Key? key,
    required this.fill,
    required this.text,
  }) : super(key: key);

  final bool fill;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 18,
          margin: const EdgeInsets.only(right: 10),
          child: fill
              ? const Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 18,
                )
              : const Icon(
                  Icons.circle,
                  size: 10,
                  color: fontBlack,
                ),
        ),
        Text(
          text,
          style:
              TextStyle(fontSize: 12, color: fill ? Colors.green : fontBlack),
        )
      ],
    );
  }
}
