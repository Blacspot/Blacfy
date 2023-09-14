import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/common/widgets/appstyle.dart';
import 'package:blacfy/common/widgets/reusable_text.dart';
import 'package:blacfy/features/auth/controllers/code_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar:AppBar(),
        body: Center(
            child: Column(
      children: [
        ReusableText(
            text: code, style: appstyle(30, AppConst.kLight, FontWeight.bold)),
        TextButton(
            onPressed: () {
              ref.read(codeStateProvider.notifier).setStart("Hello Andre");
            },
            child: Text("Press Me")),
      ],
    )));
  }
}
