import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../../const/local_data.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../../data/impl/auth_impl.dart';
import '../page/atur_ulang_view.dart';
import '../page/berhasil_sandi.dart';
import '../page/home_view.dart';
import '../page/login_view.dart';
import '../page/verifikasi_password_view.dart';

class LoginController extends ChangeNotifier {
  bool isLogin = false;
  bool visibiliti = true;
  bool visibilitidaftar = true;
  bool visibilitiAturUlang = true;
  bool syarat = false;
  bool openPass = false;
  bool openPass2 = false;
  bool sama = false;

  final AuthImpl authImpl = AuthImpl();

  RequestState reqLogin = RequestState.empty;
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;

  RequestState reqDaftar = RequestState.empty;
  late TextEditingController emailDaftar;
  late TextEditingController passwordDaftar;
  late TextEditingController nameDaftar;

  RequestState reqLupaPassword = RequestState.empty;
  late TextEditingController emailLupaPassword;

  RequestState reqVerifikasi = RequestState.empty;

  Duration expired = const Duration();
  List code = ['0', '0', '0', '0'];

  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasDigits = false;

  bool hasMinLength2 = false;
  bool hasUppercase2 = false;
  bool hasSpecialCharacters2 = false;
  bool hasDigits2 = false;
  String pesanView = "";

  RequestState reqKirimUlang = RequestState.empty;
  TextEditingController aturUlangSandi = TextEditingController();
  TextEditingController aturUlangSandi2 = TextEditingController();

  void codeChange(String value, int index) {
    code[index] = value;
  }

  void readPass() {
    if (passwordDaftar.text.isNotEmpty) {
      openPass = true;
      notifyListeners();
    } else if (passwordDaftar.text.isEmpty) {
      openPass = false;
      notifyListeners();
    }

    hasUppercase = passwordDaftar.text.contains(RegExp(r'[A-Z]'));
    hasDigits = passwordDaftar.text.contains(RegExp(r'[0-9]'));
    // bool hasLowercase = passwordDaftar.text.contains(new RegExp(r'[a-z]'));
    hasSpecialCharacters =
        passwordDaftar.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength = passwordDaftar.text.length > 7;
    notifyListeners();
  }

  void readPass2() {
    if (aturUlangSandi.text.isNotEmpty) {
      openPass2 = true;
      notifyListeners();
    } else if (aturUlangSandi.text.isEmpty) {
      openPass2 = false;
      notifyListeners();
    }

    hasUppercase2 = aturUlangSandi.text.contains(RegExp(r'[A-Z]'));
    hasDigits2 = aturUlangSandi.text.contains(RegExp(r'[0-9]'));
    // bool hasLowercase = aturUlangSandi.text.contains(new RegExp(r'[a-z]'));
    hasSpecialCharacters2 =
        aturUlangSandi.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength2 = aturUlangSandi.text.length > 7;
    notifyListeners();
  }

  void sandiSama() {
    if (sama) {
      sama = false;
      notifyListeners();
    } else {
      sama = true;
      notifyListeners();
    }
  }

  void swith() {
    if (isLogin) {
      isLogin = false;
      notifyListeners();
    } else {
      isLogin = true;
      notifyListeners();
    }
  }

  void swithSyarat() {
    if (syarat) {
      syarat = false;
      notifyListeners();
    } else {
      syarat = true;
      notifyListeners();
    }
  }

  void swithVisibiliti() {
    if (visibiliti) {
      visibiliti = false;
      notifyListeners();
    } else {
      visibiliti = true;
      notifyListeners();
    }
  }

  void swithVisibilitidafatar() {
    if (visibilitidaftar) {
      visibilitidaftar = false;
      notifyListeners();
    } else {
      visibilitidaftar = true;
      notifyListeners();
    }
  }

  void swithVisibilitiAturUlang() {
    if (visibilitiAturUlang) {
      visibilitiAturUlang = false;
      notifyListeners();
    } else {
      visibilitiAturUlang = true;
      notifyListeners();
    }
  }

  void login(BuildContext context) async {
    if (emailLogin.text.isEmpty || passwordLogin.text.isEmpty) {
      return;
    }
    reqLogin = RequestState.loading;
    notifyListeners();
    final res = await authImpl.login(emailLogin.text, passwordLogin.text);
    res.fold((l) {
      reqLogin = RequestState.empty;
      notifyListeners();
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
    }, (r) {
      reqLogin = RequestState.empty;
      LocalData().saveToken(r);

      notifyListeners();
      toRemovePage(context, const HomeView());
    });
  }

  void lupaPassword(BuildContext context) async {
    if (emailLupaPassword.text.isEmpty) {
      return;
    }
    reqLupaPassword = RequestState.loading;
    notifyListeners();
    final res = await authImpl.lupaPassword(emailLupaPassword.text);
    res.fold((l) {
      reqLupaPassword = RequestState.empty;
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
      reqLupaPassword = RequestState.empty;
      final now = DateTime.now();
      debugPrint(now.toString());
      final time = r.expired.difference(now);
      debugPrint(time.toString());
      expired = Duration(seconds: time.inSeconds);

      notifyListeners();
      toPageCupertino(context, const VerifikasiPasswordView());
    });
  }

  void kirimUlang(BuildContext context) async {
    reqLupaPassword = RequestState.loading;
    notifyListeners();
    final res = await authImpl.lupaPassword(emailLupaPassword.text);
    res.fold((l) {
      reqLupaPassword = RequestState.empty;
      notifyListeners();
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
    }, (r) {
      reqLupaPassword = RequestState.empty;
      final time = r.expired.difference(DateTime.now());
      expired = Duration(seconds: time.inSeconds);

      notifyListeners();
    });
  }

  void verifikasi(BuildContext context) async {
    reqVerifikasi = RequestState.loading;
    notifyListeners();
    final res =
        await authImpl.verifikasiToken(emailLupaPassword.text, code.join());
    res.fold((l) {
      reqVerifikasi = RequestState.empty;
      notifyListeners();
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
    }, (r) {
      reqVerifikasi = RequestState.empty;
      tokenVerivikasi = r;
      toPageCupertino(context, const AturUlangView());
      notifyListeners();
    });
  }

  String tokenVerivikasi = "";

  void updateSandi(BuildContext context) async {
    reqKirimUlang = RequestState.loading;
    notifyListeners();
    final res = await authImpl.updatePossword(
        emailLupaPassword.text, aturUlangSandi.text, tokenVerivikasi);
    res.fold((l) {
      reqKirimUlang = RequestState.empty;
      notifyListeners();
    }, (r) {
      reqKirimUlang = RequestState.empty;
      pesanView = "Berhasil Update password";
      toRemovePage(context, const BerhasilSandi());
      notifyListeners();
    });
  }

  void daftar(BuildContext context) async {
    if (hasDigits == false ||
        hasMinLength == false ||
        hasSpecialCharacters == false ||
        hasUppercase == false ||
        emailDaftar.text.isEmpty ||
        nameDaftar.text.isEmpty ||
        passwordDaftar.text.isEmpty) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: "Mohon input form dengan benar.",

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      return;
    }
    if (syarat == false) {
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: "Centang setuju dengan ketentuan layanan dan privasi",

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      return;
    }
    reqDaftar = RequestState.loading;
    notifyListeners();
    final res = await authImpl.register(
        nameDaftar.text, emailDaftar.text, passwordDaftar.text);
    res.fold((l) {
      reqDaftar = RequestState.empty;
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
      reqDaftar = RequestState.empty;
      pesanView = "Berhasil daftar silakah login";
      toRemovePage(context, const BerhasilSandi());
      notifyListeners();
    });
  }

  void masuk(BuildContext context) {
    isLogin = true;
    notifyListeners();
    toRemovePage(context, const LoginView());
  }

  void init() {
    isLogin = true;
    emailLogin = TextEditingController();
    passwordLogin = TextEditingController();
    emailLupaPassword = TextEditingController();

    nameDaftar = TextEditingController();
    passwordDaftar = TextEditingController();
    emailDaftar = TextEditingController();
  }

  @override
  void dispose() {
    emailLogin.dispose();
    passwordLogin.dispose();
    emailLupaPassword.dispose();

    nameDaftar.dispose();
    passwordDaftar.dispose();
    emailDaftar.dispose();

    aturUlangSandi.dispose();
    aturUlangSandi2.dispose();
    super.dispose();
  }
}
