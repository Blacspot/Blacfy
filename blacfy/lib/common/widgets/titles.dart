import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: ((context, ref, child) {
              return Container(
                height: 80,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius)),
                        color: AppConst.kGreen
                        ),
              );
            }
            ),
            
            )
            
          ],
        ),
      ),
    );
  }
}