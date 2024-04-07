import 'package:flutter/material.dart';

class App {
  static App? _app;

  App._();

  static App get instance => _app ??= App._();

  late GlobalKey<NavigatorState> navigator;

  void init() {
    // init navigator
    navigator = GlobalKey<NavigatorState>();
  }
}
