import 'package:flutter/services.dart';

enum Flavor { CTC, CONS }

final Map<String, Flavor> _flavorMap = {"ctc": Flavor.CTC, "cons": Flavor.CONS};

class FlavorUtil {
  static const _platform = MethodChannel('coteccons/get-flavor');
  static Future<Flavor?> getFlavor() async {
    try {
      final flavorName = await _platform.invokeMethod("getFlavor");
      return _flavorMap[flavorName];
    } catch (e) {
      return null;
    }
  }
}
