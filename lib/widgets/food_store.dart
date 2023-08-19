import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:scaler/scaler.dart';

class FoodStore extends StatelessWidget {
  final String imageUrl;
  final String name;
  final VoidCallback onTap;
  const FoodStore({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            width: Scaler.width(0.85, context),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
              children: [
                Image.asset(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "AppleSDGothicNeo700",
                        color: ColorSet.sub03,
                      ),
                    ),
                    Image.asset(
                      'assets/images/order_time.png',
                      height: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/coupon_icon.png',
                      height: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
