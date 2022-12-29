import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/main_app.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: TextFormField(
            autofocus: true,
            style: const TextStyle(color: fontPurple, fontSize: 18),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (value) {},
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
          child: TextFormField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (value) {},
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
          child: TextFormField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            onSaved: (value) {},
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
          child: TextFormField(
            style: const TextStyle(color: fontPurple),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {},
            onSaved: (value) {},
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
    ));
  }
}
