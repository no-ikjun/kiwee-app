import 'package:flutter/material.dart';

class NetWorkScreen extends StatelessWidget {
  const NetWorkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: Center(
        child: Text('No Internet Connection'),
      ),
    );
  }
}
