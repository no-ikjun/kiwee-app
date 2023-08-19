import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:scaler/scaler.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyKioskScreen extends StatelessWidget {
  const NearbyKioskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const CustomAppBar(
              logoShown: false,
              label: 'Find Nearby Kiosks',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Scaler.height(0.05, context),
                    ),
                    SvgPicture.asset(
                      'assets/images/location_icon.svg',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/landscape.png',
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Centum Dream World',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "AppleSDGothicNeo700",
                                      wordSpacing: -1,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Centum 2-ro 25, Haeundae-Gu',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "AppleSDGothicNeo500",
                                      wordSpacing: -1,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: Scaler.width(0.4, context),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(
                                                'https://m.map.naver.com/search2/search.naver?query=%EC%84%BC%ED%85%80%EB%93%9C%EB%A6%BC%EC%9B%94%EB%93%9C&sm=sug&style=v5#/map/1/21494799');
                                            try {
                                              await launchUrl(url);
                                            } catch (error) {
                                              debugPrint('브라우저 실행 실패 $error');
                                            }
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Column(
                                            children: [
                                              const Text(
                                                'MAP',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "AppleSDGothicNeo800",
                                                  color: ColorSet.primary,
                                                ),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 1,
                                                color: ColorSet.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          '226m',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AppleSDGothicNeo700",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/landscape.png',
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Centum City Station',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "AppleSDGothicNeo700",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Centum S.road 76, Haeundae-Gu',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "AppleSDGothicNeo500",
                                      wordSpacing: -1,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: Scaler.width(0.4, context),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(
                                                'https://m.map.naver.com/search2/search.naver?query=%EC%84%BC%ED%85%80%EC%8B%9C%ED%8B%B0%EC%97%AD&sm=sug&style=v5#/map/1/13479670');
                                            try {
                                              await launchUrl(url);
                                            } catch (error) {
                                              debugPrint('브라우저 실행 실패 $error');
                                            }
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Column(
                                            children: [
                                              const Text(
                                                'MAP',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "AppleSDGothicNeo800",
                                                  color: ColorSet.primary,
                                                ),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 1,
                                                color: ColorSet.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          '350m',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AppleSDGothicNeo700",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/landscape.png',
                                width: 70,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'BEXCO Station',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "AppleSDGothicNeo700",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Haeundaero 396,Haeundae-Gu',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "AppleSDGothicNeo500",
                                      wordSpacing: -1,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: Scaler.width(0.4, context),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final Uri url = Uri.parse(
                                                'https://m.map.naver.com/search2/search.naver?query=%EB%B2%A1%EC%8A%A4%EC%BD%94%EC%97%AD&sm=sug&style=v5#/map/1/13479672');
                                            try {
                                              await launchUrl(url);
                                            } catch (error) {
                                              debugPrint('브라우저 실행 실패 $error');
                                            }
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Column(
                                            children: [
                                              const Text(
                                                'MAP',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                      "AppleSDGothicNeo800",
                                                  color: ColorSet.primary,
                                                ),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 1,
                                                color: ColorSet.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Text(
                                          '397m',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: "AppleSDGothicNeo700",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
