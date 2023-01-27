import 'package:e_kantin_delivery/data/impl/work_impl.dart';
import 'package:e_kantin_delivery/domain/models/working.dart';
import 'package:e_kantin_delivery/presentasi/widget/main_snackbar.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final WorkImpl _workImpl = WorkImpl();

  bool orderMasuk = false;
  bool online = false;

  Working? working;

  // void swithOnline(bool value, BuildContext context) async {
  //   online = value;
  //   notifyListeners();
  //   if (value) {
  //     final result = await showModalBottomSheet<bool>(
  //       context: context,
  //       elevation: 2,
  //       clipBehavior: Clip.hardEdge,
  //       // backgroundColor: Color(0xffF5F5F5),
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(16), topRight: Radius.circular(16)),
  //       ),
  //       builder: (context) => const PopUpPesanan(),
  //     );

  //     if (result != null && result) {
  //       showModalBottomSheet(
  //           backgroundColor: Colors.transparent,
  //           isScrollControlled: true,
  //           context: context,
  //           builder: (context) => const DetailOrderAktif());

  //       notifyListeners();
  //     }
  //   }
  // }
  void swithOnline(bool value, BuildContext context) async {
    online = value;
    notifyListeners();
    final res = await _workImpl.setWork(value, "");
    res.fold((l) {
      online = !online;
      notifyListeners();
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(mainSnacbar(l));
    }, (r) {
      working = r;
      notifyListeners();
    });
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
