import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/button.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:scaler/scaler.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          logoShown: false,
          label: 'Order History',
          isHomeScreen: true,
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Scaler.height(0.05, context),
              ),
              SvgPicture.asset(
                'assets/images/history_icon.svg',
                width: 100,
              ),
              SizedBox(
                height: Scaler.height(0.05, context),
              ),
              Container(
                width: Scaler.width(0.85, context),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    SizedBox(
                      width: Scaler.width(1, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "AppleSDGothicNeo700",
                                  color: ColorSet.primary,
                                ),
                              ),
                              Container(
                                width: 15 * 2.5,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorSet.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Bibimbap with Brimful Galbi',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo700',
                        fontSize: 20,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Bibimmbap + Doenjang Soup + Kimchi',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo600',
                        fontSize: 17,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Order No. 20210901-0001',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo400',
                        fontSize: 15,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.015, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(
                          onPressed: () {},
                          label: 'SAVE',
                          fontSize: 18,
                          fontFamily: "AppleSDGothicNeo500",
                          width: Scaler.width(0.4, context),
                          height: 40,
                          backgroundColor: ColorSet.sub03,
                          fontColor: Colors.white,
                          borderColor: ColorSet.sub03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Scaler.height(0.02, context),
              ),
              Container(
                width: Scaler.width(0.85, context),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    SizedBox(
                      width: Scaler.width(1, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "AppleSDGothicNeo700",
                                  color: ColorSet.primary,
                                ),
                              ),
                              Container(
                                width: 15 * 2.5,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorSet.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Obong-Jip Fired Octopus & Bossam',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo700',
                        fontSize: 20,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Fried Octopus + Bossam + Kimchi',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo600',
                        fontSize: 17,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Order No. 20210901-0002',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo400',
                        fontSize: 15,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.015, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(
                          onPressed: () {},
                          label: 'SAVE',
                          fontSize: 18,
                          fontFamily: "AppleSDGothicNeo500",
                          width: Scaler.width(0.4, context),
                          height: 40,
                          backgroundColor: ColorSet.sub03,
                          fontColor: Colors.white,
                          borderColor: ColorSet.sub03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Scaler.height(0.02, context),
              ),
              Container(
                width: Scaler.width(0.85, context),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    SizedBox(
                      width: Scaler.width(1, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "AppleSDGothicNeo700",
                                  color: ColorSet.primary,
                                ),
                              ),
                              Container(
                                width: 15 * 2.5,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorSet.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Kimbap Heaven',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo700',
                        fontSize: 20,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Bibimmbap + Ramen + Kimchi',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo600',
                        fontSize: 17,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Order No. 20210901-0003',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo400',
                        fontSize: 15,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.015, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(
                          onPressed: () {},
                          label: 'SAVE',
                          fontSize: 18,
                          fontFamily: "AppleSDGothicNeo500",
                          width: Scaler.width(0.4, context),
                          height: 40,
                          backgroundColor: ColorSet.sub03,
                          fontColor: Colors.white,
                          borderColor: ColorSet.sub03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Scaler.height(0.02, context),
              ),
              Container(
                width: Scaler.width(0.85, context),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    SizedBox(
                      width: Scaler.width(1, context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "AppleSDGothicNeo700",
                                  color: ColorSet.primary,
                                ),
                              ),
                              Container(
                                width: 15 * 2.5,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: ColorSet.primary,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Fried Chicken',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo700',
                        fontSize: 20,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Chicken + Beer + Kimchi',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo600',
                        fontSize: 17,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.01, context),
                    ),
                    const Text(
                      'Order No. 20210901-1032',
                      style: TextStyle(
                        fontFamily: 'AppleSDGothicNeo400',
                        fontSize: 15,
                        color: ColorSet.sub03,
                      ),
                    ),
                    SizedBox(
                      height: Scaler.height(0.015, context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customButton(
                          onPressed: () {},
                          label: 'SAVE',
                          fontSize: 18,
                          fontFamily: "AppleSDGothicNeo500",
                          width: Scaler.width(0.4, context),
                          height: 40,
                          backgroundColor: ColorSet.sub03,
                          fontColor: Colors.white,
                          borderColor: ColorSet.sub03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Scaler.height(0.02, context),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
