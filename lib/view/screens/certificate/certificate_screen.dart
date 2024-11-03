import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mcqly/controller/certificate_controller.dart';
import 'package:mcqly/view/base/main_appbar.dart';
import 'package:mcqly/view/screens/certificate/widget/certificate_view.dart';
import 'package:open_file/open_file.dart';

class CertificateScreen extends StatelessWidget {
  final String name;
  final String field;

  const CertificateScreen({super.key, required this.name, required this.field});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppbar(),
      body: GetBuilder(
          init: CertificateController(name, field),
          builder: (controller) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                CertificationView(
                  name: name,
                  field: field,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(MingCute.download_fill),
                      onPressed: ()  async {
                        String? path = await controller.downloadCertificate();
                        if (path!= null) {
                          OpenFile.open(path);
                        }
                      },
                      label: const Text("Save in Gallery"),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(EvaIcons.share),
                      onPressed: ()  {
                        controller.shareCertificate();
                      },
                      label: const Text("share"),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
