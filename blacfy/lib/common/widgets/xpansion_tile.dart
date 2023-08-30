import 'package:blacfy/common/utils/constants.dart';
import 'package:flutter/material.dart';

class XpansionTile extends StatelessWidget {
  const XpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppConst.kBkLight, 
          borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
          ),
          child: Theme(data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent
          ), 
          child: ExpansionTile(
            title: BottomTiles())),
    );
  }
}
