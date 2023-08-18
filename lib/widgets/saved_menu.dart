import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/button.dart';
import 'package:scaler/scaler.dart';

class SavedMenu extends StatelessWidget {
  const SavedMenu({Key? key}) : super(key: key);

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '스타벅스',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "AppleSDGothicNeo800",
                      wordSpacing: -1,
                      color: ColorSet.sub03,
                    ),
                  ),
                  Text(
                    '수정하기',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "AppleSDGothicNeo400",
                      wordSpacing: -1,
                      color: Color(0xFFD4D3CF),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '아이스 아메리카노',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "AppleSDGothicNeo700",
                  wordSpacing: -1,
                  color: ColorSet.sub03,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    '매장컵 | tall | 얼음 적게',
                    style: TextStyle(
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
                onPressed: () {},
                label: '주문하기',
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
