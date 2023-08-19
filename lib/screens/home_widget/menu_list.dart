import 'package:flutter/material.dart';
import 'package:kiwee/apis/user.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/header.dart';
import 'package:kiwee/widgets/home_select_button.dart';
import 'package:kiwee/widgets/saved_menu.dart';
import 'package:scaler/scaler.dart';

Future<UserInfo> getUserInfo(BuildContext context) async {
  try {
    final response = await UserService.getUserInfo(context);
    return response;
  } catch (e) {
    debugPrint('getUserInfo error');
    rethrow;
  }
}

class MenuList extends StatefulWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  String userName = "";
  int selectedButton = 0;

  @override
  void initState() {
    super.initState();
    getUserInfo(context).then((value) {
      setState(() {
        userName = value.userId;
      });
    });
  }

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
                      Text(
                        "$userName's  ",
                        style: const TextStyle(
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
                    'Saved Menu List',
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
                    label: 'FAVORITE',
                    onPressed: () {
                      setState(() {
                        selectedButton = 0;
                      });
                    },
                    color:
                        selectedButton == 0 ? ColorSet.primary : ColorSet.sub01,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SelectButton(
                    label: 'REGULAR',
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                    },
                    color:
                        selectedButton == 1 ? ColorSet.primary : ColorSet.sub01,
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
