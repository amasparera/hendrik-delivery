import 'package:flutter/material.dart';

import '../../const/main_app.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 1,
        decoration: const BoxDecoration(color: grey2),
      ),
    );
  }
}
