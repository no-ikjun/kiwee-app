import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/screens/order/order_code_screen.dart';
import 'package:kiwee/widgets/button.dart';
import 'package:scaler/scaler.dart';

class SavedMenu extends StatelessWidget {
  final String menuName;
  final String menuSubName;
  final String menuPrice;
  final String storeName;
  final String menuUuid;
  const SavedMenu({
    Key? key,
    required this.menuName,
    required this.menuSubName,
    required this.menuPrice,
    required this.storeName,
    required this.menuUuid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: Scaler.width(0.85, context),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFFFFFFF),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(15, 0, 0, 0),
                offset: Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*
              SvgPicture.asset(
                'assets/images/wave_icon.svg',
                width: 25,
              ),
              const SizedBox(
                height: 5,
              ),
              */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    storeName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: "AppleSDGothicNeo800",
                      wordSpacing: -1,
                      color: ColorSet.sub03,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/green_star.svg',
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                menuName,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "AppleSDGothicNeo700",
                  wordSpacing: -1,
                  color: ColorSet.sub03,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    menuSubName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "AppleSDGothicNeo700",
                      wordSpacing: -1,
                      color: ColorSet.sub03,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              customButton(
                onPressed: () {
                  debugPrint(menuUuid);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderCodeScreen(
                      menuUuid: menuUuid,
                    );
                  }));
                },
                label: 'ORDER',
                width: Scaler.width(1, context),
                height: 40,
                backgroundColor: ColorSet.sub03,
                fontColor: const Color(0xFFFFFFFF),
                fontSize: 18,
                fontFamily: "AppleSDGothicNeo400",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
