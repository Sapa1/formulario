import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String sobrenome = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nome é obrigatório';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.5)),
                        ),
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.5)),
                        hintText: 'Nome',
                      ),
                      onChanged: (text) {
                        name = text;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Sobrenome é obrigatório';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black.withOpacity(0.5)),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        hintText: 'Sobrenome',
                      ),
                      onChanged: (text) {
                        sobrenome = text;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formkey.currentState.validate();
                          if (isValid) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Olá $name $sobrenome, tudo bem? :D'),
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
            ),
          ),
        ),
      ),
    );
  }
}
