import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/common/widgets/appstyle.dart';
import 'package:blacfy/common/widgets/height_spacer.dart';
import 'package:blacfy/common/widgets/reusable_text.dart';
import 'package:blacfy/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, this.color, this.title});

  final Color? color;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConst.kRadius)),
                          color: color ?? AppConst.kRed),
                    ),
                    WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                                text: title ?? "Title of Todo",
                                style: appstyle(
                                    18, AppConst.kLight, FontWeight.bold)),

                         HeightSpacer(height: 3),

                          ReusableText(
                                text: title ?? "Title of Todo",
                                style: appstyle(
                                    18, AppConst.kLight, FontWeight.bold)),           
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
