import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/screens/stores/store_info_screen.dart';
import 'package:kiwee/widgets/app_bar.dart';
import 'package:kiwee/widgets/food_category.dart';
import 'package:kiwee/widgets/food_store.dart';
import 'package:scaler/scaler.dart';

class FoodSelect extends StatelessWidget {
  const FoodSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomAppBar(
          logoShown: false,
          label: 'Category',
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
                      onTap: () {},
                    ),
                    FoodCategory(
                      imageUrl: 'chicken',
                      name: 'Chicken',
                      onTap: () {},
                    ),
                    FoodCategory(
                      imageUrl: 'pizza',
                      name: 'Pizza',
                      onTap: () {},
                    ),
                    FoodCategory(
                      imageUrl: 'japan',
                      name: 'Japanese',
                      onTap: () {},
                    ),
                    FoodCategory(
                      imageUrl: 'western',
                      name: 'Westurn',
                      onTap: () {},
                    ),
                    FoodCategory(
                      imageUrl: 'burger',
                      name: 'Burger',
                      onTap: () {},
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
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              FoodStore(
                imageUrl: 'assets/images/store_photo/bibimbap.png',
                name: 'Brimful Meat Bibimbap',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreInfoScreen(),
                    ),
                  );
                },
              ),
              FoodStore(
                imageUrl: 'assets/images/store_photo/handa.png',
                name: 'Handa-Sot Sooyeong',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreInfoScreen(),
                    ),
                  );
                },
              ),
              FoodStore(
                imageUrl: 'assets/images/store_photo/bibimbap.png',
                name: 'Brimful Meat Bibimbap',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StoreInfoScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        )),
      ],
    );
  }
}
