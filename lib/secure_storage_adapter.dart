import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:formulario/internal_storage.dart';

class SecureStorageAdapter extends InternalStorageAdapter{
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  void saveUser(String name, String surname) async {
    await secureStorage.write(key: 'name', value: name);
    await secureStorage.write(key: 'surname', value: surname);
    print('Dados seguros');
  }

  Future<String> getFullName() async {
    String? name = await secureStorage.read(key: 'name');
    String? surname = await secureStorage.read(key: 'surname');

    if ((name != null) && (surname != null)) {
      return name + ' ' + surname;
    } else {
      return 'Dados não seguros';
    }
  }
}
