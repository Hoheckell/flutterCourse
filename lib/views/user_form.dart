import 'package:fitsheet/models/user.dart';
import 'package:fitsheet/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['Nome'] = user.nome;
      _formData['Telefone'] = user.telefone;
      _formData['Email'] = user.email;
      _formData['password'] = user.password;
      _formData['avatar'] = user.avatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;

    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();
                if (isValid) {
                  _form.currentState.save();
                  Provider.of<Users>(context, listen: false).put(User(
                    id: _formData['id'],
                    nome: _formData['Nome'],
                    email: _formData['Email'],
                    telefone: _formData['Telefone'],
                    password: _formData['password'],
                    avatar: _formData['avatar'],
                  ));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _formData['Nome'],
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value.trim().isEmpty ||
                          value == null ||
                          value.trim().length <= 2) {
                        return 'nome é obrigatório e deve ter no minimo 3 caracteres';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Nome'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['Email'],
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value.trim().isEmpty ||
                          value == null ||
                          value.trim().length <= 2) {
                        return 'nome é obrigatório e deve ter no minimo 3 caracteres';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Email'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['avatar'],
                    decoration: InputDecoration(labelText: 'URL do avatar'),
                    validator: (value) {
                      if (value.trim().isEmpty ||
                          value == null ||
                          value.trim().length <= 2) {
                        return 'nome é obrigatório e deve ter no minimo 3 caracteres';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['avatar'] = value,
                  ),
                  TextFormField(
                    initialValue: _formData['Telefone'],
                    decoration: InputDecoration(labelText: 'Telefone'),
                    validator: (value) {
                      if (value.trim().isEmpty ||
                          value == null ||
                          value.trim().length <= 2) {
                        return 'nome é obrigatório e deve ter no minimo 3 caracteres';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Telefone'] = value,
                  ),
                ],
              ),
            )));
  }
}
