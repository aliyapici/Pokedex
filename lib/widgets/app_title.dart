import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/ui_helper.dart';
import '../constants/const.dart';

class AppTitle extends StatelessWidget {
  AppTitle({Key? key}) : super(key: key);

  String pokeBallImageUrl = 'images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Constants.title,
                    style: Constants.getTitleTextStyle(),
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                pokeBallImageUrl,
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 100.w
                    : 60.w,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
