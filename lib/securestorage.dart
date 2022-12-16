import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageUtil {
  static FlutterSecureStorage storage = FlutterSecureStorage();
  static const firsttime = "firsttime";
  static const String city = "city";

  //  Future<void> setfirsttime() async =>
  //    await storage.write(key: firsttime, value: false);

  static Future<void> setcityname(String location) async =>
      await storage.write(key: city, value: location);

  static Future<String?> getcityname() async => await storage.read(key: city);
}
