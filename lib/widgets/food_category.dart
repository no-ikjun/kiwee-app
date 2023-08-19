import 'package:flutter/material.dart';

class FoodCategory extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;
  const FoodCategory({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/food_icon/$imageUrl.png',
                width: 70,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "AppleSDGothicNeo500",
                  wordSpacing: -1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
