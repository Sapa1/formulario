import 'form_model.dart';

class FormController {
  final model = FormModel();

  String get name => model.name ?? '';
  String get surname => model.surname ?? '';
  Future<String> get fullName => model.getfullName();

  void updateName(String name) {
    model.name = name;
  }

  void updateSurname(String surname) {
    model.surname = surname;
  }

  void saveUser() {
    model.saveUser();
  }
}
