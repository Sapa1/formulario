import 'package:formulario/internal_storage.dart';
import 'package:formulario/secure_storage_adapter.dart';
import 'package:formulario/shared_preferences_adapter.dart';

class FormModel {
  String? name;
  String? surname;
  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter? internalStorageAdapter})
      : internalStorage = internalStorageAdapter ?? SharedPreferencesAdapter();

  void saveUser() {
    if (name == null) return;
    if (surname == null) return;
    internalStorage.saveUser(name!, surname!);
  }

  Future<String> getfullName() {
    return internalStorage.getFullName();
  }
}
