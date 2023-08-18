import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/header.dart';
import 'package:kiwee/widgets/home_select_button.dart';
import 'package:kiwee/widgets/saved_menu.dart';
import 'package:scaler/scaler.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Scaler.width(0.85, context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SelectButton(
                    label: '즐겨찾기',
                    onPressed: () {},
                    color: ColorSet.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SelectButton(
                    label: '단골식당',
                    onPressed: () {},
                    color: ColorSet.sub01,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SavedMenu(),
                SavedMenu(),
                SavedMenu(),
                SavedMenu(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
