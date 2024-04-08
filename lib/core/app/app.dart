import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youapp_frontend/core/core.dart';

part 'api.dart';

class App {
  static App? _app;

  App._();

  static App get instance => _app ??= App._();

  late GlobalKey<NavigatorState> navigator;
  late Dio client;

  void init() {
    // init navigator
    navigator = GlobalKey<NavigatorState>();

    // init api
    client = Api.instance._init();
  }
}
