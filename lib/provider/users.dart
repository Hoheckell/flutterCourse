import 'dart:math';

import 'package:fitsheet/data/dummy_users.dart';
import 'package:fitsheet/models/user.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(i) {
    return _items.values.elementAt(i);
  }

  void put(User u) {
    if (u == null) {
      return;
    }
    if (u.id != null && u.id.trim().isNotEmpty && _items.containsKey(u.id)) {
      _items.update(
          u.id,
          (_) => User(
              id: u.id,
              nome: u.nome,
              email: u.email,
              telefone: u.telefone,
              avatar: u.avatar,
              password: u.avatar));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
              id: id,
              nome: u.nome,
              email: u.email,
              telefone: u.telefone,
              avatar: u.avatar,
              password: u.avatar));
    }
    notifyListeners();
  }

  void remove(User u) {
    if (u.id != null && u != null) {
      _items.remove(u.id);
      notifyListeners();
    }
  }
}
