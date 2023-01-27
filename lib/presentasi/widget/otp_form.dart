import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../../const/main_app.dart';
import '../controller/login_controller.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final co = context.read<LoginController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            autofocus: true,
            style: const TextStyle(color: fontPurple, fontSize: 18),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              co.codeChange(value, 0);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              fillColor: const Color(0xffFAFAFA),
              filled: true,
              focusColor: const Color(0xff767475),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffEEEEEE),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff767475),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              co.codeChange(value, 1);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              fillColor: const Color(0xffFAFAFA),
              filled: true,
              focusColor: const Color(0xff767475),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffEEEEEE),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff767475),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              co.codeChange(value, 2);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              fillColor: const Color(0xffFAFAFA),
              filled: true,
              focusColor: const Color(0xff767475),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffEEEEEE),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff767475),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 18),
        SizedBox(
          height: 68,
          width: 64,
          child: TextField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              co.codeChange(value, 3);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              fillColor: const Color(0xffFAFAFA),
              filled: true,
              focusColor: const Color(0xff767475),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffEEEEEE),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xff767475),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
