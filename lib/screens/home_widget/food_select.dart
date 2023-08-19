import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiwee/apis/store.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/screens/stores/store_info_screen.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/food_category.dart';
import 'package:kiwee/widgets/food_store.dart';
import 'package:scaler/scaler.dart';

class FoodSelect extends StatefulWidget {
  const FoodSelect({Key? key}) : super(key: key);

  @override
  State<FoodSelect> createState() => _FoodSelectState();
}

class _FoodSelectState extends State<FoodSelect> {
  String category = 'Korean';
  List<StoreInfo> storeInfo = [];
  bool isLoading = false;

  Future<void> getStoreInfoByCategory(
    BuildContext context,
    String category,
  ) async {
    setState(() {
      isLoading = true;
    });
    try {
      final response =
          await StoreService.getStoreInfoByCategory(context, category);
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
    getStoreInfoByCategory(context, "한식");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBar(
          logoShown: false,
          label: category,
          isHomeScreen: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Scaler.width(1, context),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FoodCategory(
                      imageUrl: 'korean',
                      name: 'Korean',
                      onTap: () async {
                        setState(() {
                          category = 'Korean';
                        });
                        await getStoreInfoByCategory(context, "한식");
                      },
                    ),
                    FoodCategory(
                      imageUrl: 'chicken',
                      name: 'Chicken',
                      onTap: () async {
                        setState(() {
                          category = 'Chicken';
                        });
                        await getStoreInfoByCategory(context, "치킨");
                      },
                    ),
                    FoodCategory(
                      imageUrl: 'pizza',
                      name: 'Pizza',
                      onTap: () async {
                        setState(() {
                          category = 'Pizza';
                        });
                        await getStoreInfoByCategory(context, "피자");
                      },
                    ),
                    FoodCategory(
                      imageUrl: 'japan',
                      name: 'Japanese',
                      onTap: () async {
                        setState(() {
                          category = 'Japanese';
                        });
                        await getStoreInfoByCategory(context, "일식");
                      },
                    ),
                    FoodCategory(
                      imageUrl: 'western',
                      name: 'Westurn',
                      onTap: () async {
                        setState(() {
                          category = 'Western';
                        });
                        await getStoreInfoByCategory(context, "양식");
                      },
                    ),
                    FoodCategory(
                      imageUrl: 'burger',
                      name: 'Burger',
                      onTap: () async {
                        setState(() {
                          category = 'Burger';
                        });
                        await getStoreInfoByCategory(context, "버거");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Scaler.width(0.85, context),
              child: Stack(
                children: [
                  const Text(
                    'STORES',
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
                            borderRadius: BorderRadius.circular(0),
                            color: ColorSet.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        isLoading
            ? const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ],
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      storeInfo.length,
                      (index) => FoodStore(
                        imageUrl: storeInfo[index].photo,
                        name: storeInfo[index].storeName,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StoreInfoScreen(
                                storeUuid: storeInfo[index].storeUuid,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
