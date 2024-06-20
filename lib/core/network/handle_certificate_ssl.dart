import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mobile_banking/data/model/global/global_model.dart';
import 'package:mobile_banking/injection/dependency_injection.dart';

class HandleCertificateSsl extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    context ??= SecurityContext.defaultContext;
    context.setTrustedCertificatesBytes(sl<Global>().rawData);
    _getCertificate();
    return super.createHttpClient(context);
  }

  _getCertificate() async {
    final ByteData crtData = await rootBundle.load("assets/files/certssl.pem");
    var map = <String, int>{};
    for (int i = 0; i < crtData.buffer.asUint8List().length; i++) {
      map[i.toString()] = crtData.buffer.asUint8List()[i];
    }
  }
}
