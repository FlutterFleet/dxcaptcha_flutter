import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:dxcaptcha_flutter/dxcaptcha_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DxCaptcha Plugin'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              DxCaptchaFlutter.setMethodCallHandler((MethodCall call) async {
                if (call.method == 'success') {
                  final res = jsonDecode(call.arguments as String)
                      as Map<String, dynamic>;
                  final dxToken = res['token'] as String?;
                } else if (call.method == 'error') {}
              });
              await DxCaptchaFlutter.show({
                'appId': '26ba29b6a3744dbebee8e46fbe3f311a',
                'language': 'en',
              });
            },
            child: const Text('Show Captcha'),
          ),
        ),
      ),
    );
  }
}
