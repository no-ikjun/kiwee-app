import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiwee/apis/menu.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/screens/order/nearby_kiosk_screen.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scaler/scaler.dart';

Future<String> getStoreNameByMenuId(
    BuildContext context, String menuUuid) async {
  try {
    final response = await MenuService.getStoreNameByMenuId(context, menuUuid);
    return response;
  } catch (e) {
    debugPrint('getStoreName error');
    rethrow;
  }
}

class OrderCodeScreen extends StatefulWidget {
  final String menuUuid;
  const OrderCodeScreen({
    Key? key,
    required this.menuUuid,
  }) : super(key: key);

  @override
  State<OrderCodeScreen> createState() => _OrderCodeScreenState();
}

class _OrderCodeScreenState extends State<OrderCodeScreen> {
  MenuInfo? menuInfo;
  String storeName = "";
  bool isLoading = false;

  Future<void> getMenuInfo(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await MenuService.getMenuInfoByUuid(context, widget.menuUuid);
      menuInfo = response;
    } catch (e) {
      debugPrint('getMenuInfo error');
      rethrow;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getMenuInfo(context);
    super.initState();
    getStoreNameByMenuId(context, widget.menuUuid).then((value) {
      setState(() {
        storeName = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              logoShown: false,
              label: 'ORDER',
              isHomeScreen: false,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          isLoading
                              ? Container(
                                  width: Scaler.width(0.85, context),
                                  height: Scaler.height(0.7, context),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFFFFFFF),
                                    border: Border.all(
                                      color: ColorSet.sub02,
                                      width: 1,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(15, 0, 0, 0),
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: const CupertinoActivityIndicator(
                                    radius: 20,
                                  ),
                                )
                              : Container(
                                  width: Scaler.width(0.85, context),
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFFFFFFF),
                                    border: Border.all(
                                      color: ColorSet.sub02,
                                      width: 1,
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(15, 0, 0, 0),
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: SizedBox(
                                    width: Scaler.width(1, context),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: Scaler.width(1, context),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                child: const Text(
                                                  'Cancle',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily:
                                                        "AppleSDGothicNeo700",
                                                    wordSpacing: -1,
                                                    color: ColorSet.sub02,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              storeName,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontFamily:
                                                    "AppleSDGothicNeo700",
                                                wordSpacing: -1,
                                                color: ColorSet.sub03,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              menuInfo!.menuName,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily:
                                                    "AppleSDGothicNeo500",
                                                wordSpacing: -1,
                                                color: ColorSet.sub03,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              menuInfo!.subName,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    "AppleSDGothicNeo500",
                                                wordSpacing: -1,
                                                color: ColorSet.sub03,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Order Number: ${menuInfo!.menuUuid.split('-')[0]}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    "AppleSDGothicNeo500",
                                                wordSpacing: -1,
                                                color: ColorSet.sub03,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ColorSet.sub02,
                                              width: 0.5,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        QrImageView(
                                          data: widget.menuUuid,
                                          size: Scaler.width(0.65, context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/qr_ment.png',
                        width: Scaler.width(0.6, context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: Scaler.width(0.85, context),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NearbyKioskScreen();
                      },
                    ),
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/location_icon.svg',
                      width: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Find Nearby Kiosks',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "AppleSDGothicNeo700",
                            wordSpacing: -1,
                            color: ColorSet.primary,
                          ),
                        ),
                        Container(
                          width: 16 * 8.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorSet.primary,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ],
                    )
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
