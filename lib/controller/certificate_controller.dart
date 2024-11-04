import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../view/screens/certificate/widget/certificate_view.dart';

class CertificateController extends GetxController {
  final String name;
  final String field;

  CertificateController(this.name, this.field);

  // Future<bool> checkPermission() async {
  //   var p = await Permission.accessMediaLocation.request();
  //   return p.isGranted;
  // }

  Future<String?> downloadCertificate() async {
    ScreenshotController screenshotController = ScreenshotController();
    final Directory appDocumentsDir = await getTemporaryDirectory();
    String path = "${appDocumentsDir.path}/${UniqueKey().hashCode}.png";
    final bytes = await screenshotController
        .captureFromWidget(CertificationView(
      name: name,
      field: field,
    ));
    await Gal.putImageBytes(bytes);
    await File(path).writeAsBytes(bytes);
    return path;
  }

  Future<void> shareCertificate() async {
    String? path = await downloadCertificate();
    if (path != null) {
      Share.shareXFiles(
        [XFile(path)],
        text: 'Congratulation, For Completing $field Quiz',
        subject: 'My Certificate',
      );
    }
  }
}
