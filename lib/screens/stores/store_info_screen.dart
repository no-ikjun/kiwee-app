import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwee/apis/store.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/menu_info.dart';
import 'package:scaler/scaler.dart';

class StoreInfoScreen extends StatefulWidget {
  final String storeUuid;
  const StoreInfoScreen({
    Key? key,
    required this.storeUuid,
  }) : super(key: key);

  @override
  State<StoreInfoScreen> createState() => _StoreInfoScreenState();
}

class _StoreInfoScreenState extends State<StoreInfoScreen> {
  bool isLoading = false;
  StoreInfo? storeInfo;
  Future<void> getStoreInfoById(BuildContext context, String storeUuid) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await StoreService.getStoreInfoById(context, storeUuid);
      setState(() {
        storeInfo = response;
      });
    } catch (e) {
      debugPrint('getStoreInfo error');
      rethrow;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getStoreInfoById(context, widget.storeUuid);
  }

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
              isHomeScreen: false,
            ),
            Expanded(
              child: isLoading
                  ? const CupertinoActivityIndicator(
                      radius: 20,
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Image.asset(
                            storeInfo?.photo != null && storeInfo?.photo != ''
                                ? 'assets/images/store_photo/${storeInfo?.photo}'
                                : 'assets/images/store_background.png',
                            width: Scaler.width(1, context),
                          ),
                          SizedBox(
                            width: Scaler.width(0.85, context),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  storeInfo?.storeName ?? '',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontFamily: "AppleSDGothicNeo700",
                                    color: ColorSet.sub03,
                                    wordSpacing: -1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    debugPrint('show info');
                                  },
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  child: const Text(
                                    'Store/Orifin Info. >',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "AppleSDGothicNeo400",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Stack(
                                  children: [
                                    const Text(
                                      'ICONICS',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "AppleSDGothicNeo700",
                                        color: ColorSet.sub03,
                                      ),
                                    ),
                                    Positioned(
                                      top: 48 / 3,
                                      child: Opacity(
                                        opacity: 0.15,
                                        child: SizedBox(
                                          height: 21 / 2.5,
                                          width: 21 * 3.45,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              color: ColorSet.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                MenuInfo(
                                  imageUrl: 'assets/images/food_example.png',
                                  name: 'Bibimbap with Galbi',
                                  subName:
                                      'Bibimbap+Doenjang Stew+Special Sauce',
                                  price: '9900',
                                  onTap: () {},
                                ),
                                MenuInfo(
                                  imageUrl: 'assets/images/food_example.png',
                                  name: 'Bibimbap with Galbi',
                                  subName:
                                      'Bibimbap+Doenjang Stew+Special Sauce',
                                  price: '9900',
                                  onTap: () {},
                                ),
                                MenuInfo(
                                  imageUrl: 'assets/images/food_example.png',
                                  name: 'Bibimbap with Galbi',
                                  subName:
                                      'Bibimbap+Doenjang Stew+Special Sauce',
                                  price: '9900',
                                  onTap: () {},
                                ),
                                MenuInfo(
                                  imageUrl: 'assets/images/food_example.png',
                                  name: 'Bibimbap with Galbi',
                                  subName:
                                      'Bibimbap+Doenjang Stew+Special Sauce',
                                  price: '9900',
                                  onTap: () {},
                                ),
                                MenuInfo(
                                  imageUrl: 'assets/images/food_example.png',
                                  name: 'Bibimbap with Galbi',
                                  subName:
                                      'Bibimbap+Doenjang Stew+Special Sauce',
                                  price: '9900',
                                  onTap: () {},
                                )
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
