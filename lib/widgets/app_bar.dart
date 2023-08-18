import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';

class CustomAppBar extends StatelessWidget {
  final bool logoShown;
  final String label;
  final bool isHomeScreen;
  final Widget iconData;
  final bool homeButtonShown;

  const CustomAppBar({
    super.key,
    this.logoShown = true,
    this.label = '',
    this.isHomeScreen = false,
    this.iconData = const Icon(
      Icons.arrow_back_ios,
      color: Color(0xff7c7c7c),
      size: 20,
    ),
    this.homeButtonShown = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xfffcfcfc),
      elevation: 0,
      leading: IconButton(
        iconSize: 20,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        padding: const EdgeInsets.only(left: 20),
        icon: isHomeScreen
            ? Container()
            : const Icon(
                Icons.home,
                color: ColorSet.sub03,
                size: 20,
              ),
        onPressed: isHomeScreen
            ? () {}
            : () {
                Navigator.pop(context);
              },
      ),
      title: logoShown
          ? Container()
          : Text(
              label,
              style: const TextStyle(
                color: ColorSet.sub03,
                fontFamily: "AppleSDGothicNeo700",
                letterSpacing: -0.5,
                fontSize: 18,
              ),
            ),
    );
  }
}
