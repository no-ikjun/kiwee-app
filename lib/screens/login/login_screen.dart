import 'package:flutter/material.dart';
import 'package:kiwee/common/ui/color_set.dart';
import 'package:kiwee/widgets/button.dart';
import 'package:scaler/scaler.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kiwee',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "AppleSDGothicNeo900",
                    color: ColorSet.primary,
                    wordSpacing: -1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: Scaler.width(0.85, context),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                maxLines: 1,
                decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  contentPadding: EdgeInsets.all(12),
                  hintText: '아이디를 입력하세요',
                  hintStyle: TextStyle(
                    fontFamily: "AppleSDGothicNeo500",
                    fontSize: 14,
                    color: Color(0xFF787878),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorSet.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF3F3F3), width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Scaler.width(0.85, context),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: (value) {},
                maxLines: 1,
                decoration: const InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  contentPadding: EdgeInsets.all(12),
                  hintText: '비밀번호를 입력하세요',
                  hintStyle: TextStyle(
                    fontFamily: "AppleSDGothicNeo500",
                    fontSize: 14,
                    color: Color(0xFF787878),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorSet.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF3F3F3), width: 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Scaler.width(0.85, context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '계정 찾기 | 회원가입하기',
                    style: TextStyle(
                      fontFamily: "AppleSDGothicNeo500",
                      fontSize: 14,
                      color: ColorSet.sub03,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            customButton(
              onPressed: () {},
              label: '로그인',
              width: Scaler.width(0.85, context),
              height: 43,
              fontSize: 14,
              backgroundColor: ColorSet.primary,
              borderColor: ColorSet.primary,
              fontColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
