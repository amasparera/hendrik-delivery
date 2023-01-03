import 'package:flutter/material.dart';

import '../widget/detail_order_aktif.dart';
import '../widget/pop_up_pesanan.dart';

class HomeController extends ChangeNotifier {
  bool orderMasuk = false;
  bool online = false;

  void swithOnline(bool value, BuildContext context) async {
    online = value;
    notifyListeners();
    if (value) {
      final result = await showModalBottomSheet<bool>(
        context: context,
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        // backgroundColor: Color(0xffF5F5F5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (context) => const PopUpPesanan(),
      );

      if (result != null && result) {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => const DetailOrderAktif());

        notifyListeners();
      }
    }
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
