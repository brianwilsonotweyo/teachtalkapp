import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = _storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = _storage.read(key: key);
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = _storage.delete(key: key);
    return deleteData;
  }
}
