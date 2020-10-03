import 'package:flutter/material.dart';

class User {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String password;
  final String avatar;

  const User(
      {this.id,
      @required this.nome,
      this.email,
      @required this.telefone,
      @required this.password,
      this.avatar});
}
