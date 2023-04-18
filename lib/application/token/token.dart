import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> saveToken(String token) async {
    await _box.write('token', token);
  }

  static String? getToken() {
    return _box.read('token');
  }
}
