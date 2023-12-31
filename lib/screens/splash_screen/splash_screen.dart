import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwee/screens/home_screen.dart';
import 'package:kiwee/screens/login/login_screen.dart';
import 'package:kiwee/screens/splash_screen/network_error_screen.dart';
import 'package:scaler/scaler.dart';

final Connectivity _connectivity = Connectivity();

Future<ConnectivityResult> checkNetwork(BuildContext context) async {
  ConnectivityResult result = await _connectivity.checkConnectivity();
  return result;
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;

  @override
  void initState() {
    _visible = !_visible;
    super.initState();

    Timer(const Duration(seconds: 1), () async {
      final value = await checkNetwork(context);
      if (!mounted) return;
      //debugPrint(value.toString());
      if (value == ConnectivityResult.none) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NetWorkScreen()));
        return;
      }
      const storage = FlutterSecureStorage();
      storage.read(key: "access_token").then((value) {
        debugPrint(value.toString());
        if (value == "" || value == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          return;
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
          return;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        color: const Color(0xfffcfcfc),
        child: Center(
          child: Image.asset(
            'assets/images/splash_icon.png',
            width: Scaler.width(0.4, context),
          ),
        ),
      ),
    );
  }
}
