import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/common/widgets/appstyle.dart';
import 'package:blacfy/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../../../common/widgets/width_spacer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
                text: "Todo ",
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
            ReusableText(
                text: "Todo ",
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
            ReusableText(
                text: "Todo ",
                style: appstyle(26, AppConst.kBlueLight, FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
