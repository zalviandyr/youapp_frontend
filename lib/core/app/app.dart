import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youapp_frontend/core/core.dart';

part 'api.dart';

class App {
  static App? _app;

  App._();

  static App get instance => _app ??= App._();

  late GlobalKey<NavigatorState> navigator;
  late Dio client;
  late SharedPreferences _storage;

  Future<void> init() async {
    // init navigator
    navigator = GlobalKey<NavigatorState>();

    // init api
    client = Api.instance._init();

    // init storage
    _storage = await SharedPreferences.getInstance();
  }

  Future<void> storeUser(AuthModel auth) async {
    await _storage.setString('auth_user', auth.toString());
  }

  AuthModel? currentUser() {
    String? user = _storage.getString('auth_user');

    if (user == null) return null;

    return AuthModel.fromString(user);
  }

  void logout() => _storage.clear();
}
