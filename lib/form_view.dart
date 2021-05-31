import 'package:flutter/material.dart';
import 'form_controller.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  final controller = FormController();

  String name = '';
  String surname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.45,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  children: [
                    RegisterTextField(
                      hintText: 'Nome',
                      onChanged: (text) {
                        controller.updateName(text);
                      },
                    ),
                    RegisterTextField(
                      hintText: 'Sobrenome',
                      onChanged: (text) {
                        controller.updateSurname(text);
                      },
                    ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 15,
                            child: ElevatedButton(
                              onPressed: () {
                                final isValid =
                                    _formKey.currentState!.validate();
                                if (isValid) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                            'Olá ${controller.name} ${controller.surname}'),
                                        actions: [
                                          FloatingActionButton(
                                            onPressed: () {
                                              controller.saveUser();
                                            },
                                            child: Text('Salvar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text('Validar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<String>(
                        future: controller.fullName,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? '',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          );
                        })
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 3),
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class RegisterTextField extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;

  RegisterTextField({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Campo $hintText é obrigatório';
          }
          return null;
        },
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChanged,
      ),
      margin: EdgeInsets.all(20),
    );
  }
}
