import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/header.dart';
import 'package:scaler/scaler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffcfcfc),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const CustomAppBar(
              logoShown: false,
              label: '',
              isHomeScreen: true,
            ),
            const CustomHeader(label: 'good'),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Scaler.width(0.85, context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          const Text(
                            '키위새님의  ',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: "AppleSDGothicNeo800",
                              wordSpacing: -1,
                            ),
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              color: ColorSet.primary,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        '저장된 메뉴 리스트',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "AppleSDGothicNeo800",
                          wordSpacing: -1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
