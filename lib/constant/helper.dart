import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UriHelper {
  static Uri createUrl({
    required String host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) =>
      Uri(
        scheme: "https",
        host: host,
        path: path,
        queryParameters: queryParameters,
      );
}

showDefaultSnackbar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar
    ..showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
}

class MySharedPreferences {
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  Future setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }

  Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? "";
  }

  Future delete() async {
    final p = await prefs;
    return p.clear();
  }
}
