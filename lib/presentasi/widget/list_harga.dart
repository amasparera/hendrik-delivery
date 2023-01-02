import 'package:flutter/material.dart';

class ListHarga extends StatelessWidget {
  const ListHarga({
    Key? key,
    required this.text,
    required this.quantity,
  }) : super(key: key);

  final String text;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          text,
          style: const TextStyle(fontSize: 12),
        )),
        Text(
          quantity,
          style: const TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
