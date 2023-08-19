import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/screens/login/login_screen.dart';
import 'package:scaler/scaler.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
    required this.label,
    this.logoShown = true,
    this.isHomeScreen = false,
  }) : super(key: key);

  final String label;
  final bool logoShown;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Scaler.width(1, context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Scaler.width(0.85, context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/images/bell_icon.svg',
                  width: 20,
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    const storage = FlutterSecureStorage();
                    storage.delete(key: 'access_token');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                  child: SvgPicture.asset(
                    'assets/images/menu_icon.svg',
                    width: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
