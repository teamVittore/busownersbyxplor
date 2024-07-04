import 'package:admin_app/core/models/error_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper/common_snackbar.dart';

void findIfErrorInResponse(String? result, BuildContext context) {
  debugPrint(result);
  final errorModel = errorModelFromJson(result!);
  if (errorModel.status == "fail") {
    CommonSnackBar.showSnackBar(
      context,
      "${errorModel.error?.code} \n${errorModel.error?.message}",
    );
    Navigator.of(context).pop(result);
  } else {
    Navigator.of(context).pop(result);
  }
}

Future<bool?> showToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
