import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool orderMasuk = false;
  bool online = false;

  void swithOnline(bool value) {
    online = value;
    notifyListeners();
  }

  Future<void> pesananMasuk() async {
    await Future.delayed(Duration(seconds: 2));

    orderMasuk = true;
    notifyListeners();
  }

  show(BuildContext context) {
    showBottomSheet(
        context: context,
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (context) => Container(
              height: 600,
              width: double.infinity,
              color: Colors.red,
            ));
  }
}
