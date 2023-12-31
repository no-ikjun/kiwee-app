import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';

class MenuInfoWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subName;
  final String price;
  final VoidCallback onTap;
  const MenuInfoWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.subName,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffe5e5e5),
              width: 0.5,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: "AppleSDGothicNeo600",
                      fontSize: 18,
                      color: ColorSet.sub03,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    subName,
                    style: const TextStyle(
                      fontFamily: "AppleSDGothicNeo400",
                      fontSize: 15,
                      color: Color(0xFF7D7D7D),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$price KRW',
                        style: const TextStyle(
                          fontFamily: "AppleSDGothicNeo600",
                          fontSize: 16,
                          color: ColorSet.sub03,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  width: 80,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
