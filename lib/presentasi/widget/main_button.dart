import 'package:flutter/material.dart';

import '../../const/main_app.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.onPress,
    this.text,
    this.symetry,
    this.borderRadius,
    this.child,
    this.vertical = 0,
    this.paddingButtom,
    this.fontSize,
  }) : super(key: key);

  final VoidCallback onPress;
  // jika text null maka Widget wajib di isi
  final String? text;
  final double? symetry;
  final BorderRadius? borderRadius;
  final Widget? child;
  final double vertical;
  final EdgeInsets? paddingButtom;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: symetry ?? padding, vertical: vertical),
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: paddingButtom ?? const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: purple,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
          ),
          onPressed: onPress,
          child: child ??
              Text(
                text!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize ?? 15),
              )),
    );
  }
}
