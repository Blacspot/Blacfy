// ignore_for_file: unused_import

import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/features/onboarding/pages/onboarding.dart';
import 'package:blacfy/features/onboarding/widgets/page_two.dart';
import 'package:blacfy/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Blacfy',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppConst.kBkDark,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            themeMode: ThemeMode.dark,
            home: const Onboarding(),
          );
        });
  }
}
