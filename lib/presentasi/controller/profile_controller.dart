import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../const/local_data.dart';
import '../../const/request_datate.dart';
import '../../data/impl/profile_impl.dart';
import '../../domain/models/user_model.dart';

class ProfileController extends ChangeNotifier {
  RequestState reqProfile = RequestState.loading;
  final ProfileImpl _profileImpl = ProfileImpl();

  RequestState reqEdit = RequestState.empty;

  UserModel? userModel;
  bool imageError = false;

  File? profile;

  late TextEditingController namaLengkap;
  late TextEditingController alamat;
  late TextEditingController nomorTelpon;

  void updateProfile(BuildContext context) async {
    reqProfile = RequestState.loading;
    notifyListeners();
    final res = await _profileImpl.updateProfile(
        namaLengkap.text, alamat.text, nomorTelpon.text,
        photo: profile);
    res.fold((l) {
      reqProfile = RequestState.empty;
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: l,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      notifyListeners();
    }, (r) {
      reqProfile = RequestState.empty;
      getProfile();
      Navigator.of(context).pop();
      notifyListeners();
    });
  }

  void getProfile() async {
    reqProfile = RequestState.loading;

    final res = await _profileImpl.getProfile();
    res.fold((l) {
      reqProfile = RequestState.empty;
      namaLengkap = TextEditingController();
      alamat = TextEditingController();
      nomorTelpon = TextEditingController();
      notifyListeners();
    }, (r) {
      reqProfile = RequestState.empty;

      userModel = r;
      namaLengkap = TextEditingController(text: r.name);
      alamat = TextEditingController();
      nomorTelpon = TextEditingController(text: r.phoneNumber);
      LocalData().saveId(userModel!.courier!);
      notifyListeners();
    });
  }

  void setError() {
    imageError = true;
    notifyListeners();
  }

  Future<void> getFoto(BuildContext context) async {
    // showModalBottomSheet(
    //     context: context,
    //     shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(12), topRight: Radius.circular(12))),
    //     builder: (context) => BottomSheet(
    //           builder: (context) => Container(
    //             height: 100,
    //             padding: const EdgeInsets.symmetric(
    //                 horizontal: padding, vertical: 12),
    //             width: double.infinity,child: ,
    //           ),
    //           onClosing: () {},
    //         ));
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      profile = File(file.path);
      if (kDebugMode) {
        print('dapat');
      }
      notifyListeners();
    } else {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: 'Gagal mengambil poto',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  void init() {
    getProfile();
  }
}
