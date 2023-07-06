import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigate {
  Navigate._();

  static Future<T?> to<T>(BuildContext context, Widget page,
      {String? identifier}) async {
    final res = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
        settings:
            RouteSettings(name: identifier ?? page.runtimeType.toString()),
      ),
    );
    return res;
  }

  static Future<T?> cupertinoTo<T>(BuildContext context, Widget page,
      {String? identifier}) async {
    final res = await Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => page,
        settings:
            RouteSettings(name: identifier ?? page.runtimeType.toString()),
      ),
    );
    return res;
  }

  static Future<T?> adaptiveTo<T>(BuildContext context, Widget page,
      {String? identifier}) async {
    return Platform.isAndroid
        ? to(context, page, identifier: identifier)
        : cupertinoTo(context, page, identifier: identifier);
  }
}
