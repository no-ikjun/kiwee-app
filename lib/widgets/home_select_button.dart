import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String label;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Container(
        width: 102,
        height: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: color,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/star_icon.svg",
              height: 15,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "AppleSDGothicNeo500",
                color: Color(0xFFFBFAFA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
