import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwee/apis/menu.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/screens/home_screen.dart';
import 'package:kiwee/screens/order/order_code_screen.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/button.dart';
import 'package:scaler/scaler.dart';

Future<void> saveMenuInfo(BuildContext context, String menuUuid) async {
  try {
    await MenuService.saveMenuInfo(context, menuUuid);
  } catch (e) {
    debugPrint('saveMenu error');
    rethrow;
  }
}

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

class OrderDetailScreen extends StatefulWidget {
  final String menuUuid;
  const OrderDetailScreen({
    Key? key,
    required this.menuUuid,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
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
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const CustomAppBar(
              logoShown: false,
              label: 'Order Details',
              isHomeScreen: false,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
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
                                border: Border.all(width: 0),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
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
                                            highlightColor: Colors.transparent,
                                            child: const Text(
                                              'Edit',
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
                                            fontFamily: "AppleSDGothicNeo700",
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
                                            fontFamily: "AppleSDGothicNeo500",
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
                                            fontFamily: "AppleSDGothicNeo500",
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
                                            fontFamily: "AppleSDGothicNeo500",
                                            wordSpacing: -1,
                                            color: ColorSet.sub03,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: Scaler.width(1, context),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            '${menuInfo!.menuPrice} KRW',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "AppleSDGothicNeo600",
                                              wordSpacing: -1,
                                              color: ColorSet.sub03,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                    SizedBox(
                                      width: Scaler.width(1, context),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            '    Total',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "AppleSDGothicNeo700",
                                              wordSpacing: -1,
                                              color: ColorSet.primary,
                                            ),
                                          ),
                                          Text(
                                            '${menuInfo!.menuPrice} KRW',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontFamily: "AppleSDGothicNeo700",
                                              wordSpacing: -1,
                                              color: ColorSet.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: Scaler.width(1, context),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          customButton(
                                            onPressed: () {
                                              saveMenuInfo(
                                                context,
                                                menuInfo!.menuUuid,
                                              ).then((value) {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomeScreen(),
                                                  ),
                                                );
                                              });
                                            },
                                            label: 'Save to List',
                                            fontFamily: "AppleSDGothicNeo300",
                                            backgroundColor: ColorSet.sub03,
                                            borderColor: ColorSet.sub03,
                                            fontColor: const Color(0xFFFFFFFF),
                                            fontSize: 17,
                                            width: Scaler.width(0.35, context),
                                            height: 45,
                                          ),
                                          customButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return OrderCodeScreen(
                                                  menuUuid: menuInfo!.menuUuid,
                                                );
                                              }));
                                            },
                                            label: 'ORDER',
                                            fontFamily: "AppleSDGothicNeo300",
                                            backgroundColor: ColorSet.sub03,
                                            borderColor: ColorSet.sub03,
                                            fontColor: const Color(0xFFFFFFFF),
                                            fontSize: 17,
                                            width: Scaler.width(0.35, context),
                                            height: 45,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
