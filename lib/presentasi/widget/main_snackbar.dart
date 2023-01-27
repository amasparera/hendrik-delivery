import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar mainSnacbar(String msg, {ContentType? contentType}) => SnackBar(

    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    // behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      inMaterialBanner: true,
      title: 'Gagal!',
      message: msg,

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: contentType ?? ContentType.failure,
    ));
