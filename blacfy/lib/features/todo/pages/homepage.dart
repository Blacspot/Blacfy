import 'package:blacfy/common/utils/constants.dart';
import 'package:blacfy/common/widgets/appstyle.dart';
import 'package:blacfy/common/widgets/custom_text.dart';
import 'package:blacfy/common/widgets/height_spacer.dart';
import 'package:blacfy/common/widgets/reusable_text.dart';
import 'package:blacfy/common/widgets/xpansion_tile.dart';
import 'package:blacfy/features/todo/controllers/xpansion_provider.dart';
import 'package:blacfy/features/todo/pages/add.dart';
import 'package:blacfy/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: unused_import
import '../../../common/widgets/width_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: "Dashboard",
                          style:
                              appstyle(18, AppConst.kLight, FontWeight.bold)),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 211, 158, 158),
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddTask()));
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppConst.kBkDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(height: 20),
                CustomTextField(
                  hintText: "Search",
                  controller: search,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(
                        AntDesign.search1,
                        color: AppConst.kGreyLight,
                      ),
                    ),
                  ),
                  suffixIcon: const Icon(
                    FontAwesome.sliders,
                    color: AppConst.kGreyLight,
                  ),
                ),
                const HeightSpacer(height: 15),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(children: [
            const HeightSpacer(height: 25),
            Row(
              children: [
                const Icon(
                  FontAwesome.tasks,
                  size: 20,
                  color: AppConst.kLight,
                ),
                const WidthSpacer(width: 10),
                ReusableText(
                    text: "Today's Task",
                    style: appstyle(18, AppConst.kLight, FontWeight.bold))
              ],
            ),
            const HeightSpacer(height: 25),
            Container(
              decoration: BoxDecoration(
                color: AppConst.kLight,
                borderRadius: BorderRadius.circular(AppConst.kRadius),
              ),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConst.kRadius))),
                controller: tabController,
                labelPadding: EdgeInsets.zero,
                isScrollable: false,
                labelColor: AppConst.kBlueLight,
                labelStyle: appstyle(24, AppConst.kBlueLight, FontWeight.w700),
                unselectedLabelColor: AppConst.kLight,
                tabs: [
                  Tab(
                    child: SizedBox(
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReusableText(
                            text: "Pending",
                            style: appstyle(
                                16, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.w),
                      width: AppConst.kWidth * 0.5,
                      child: Center(
                        child: ReusableText(
                            text: "Completed",
                            style: appstyle(
                                16, AppConst.kBkDark, FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const HeightSpacer(height: 20),
            SizedBox(
              height: AppConst.kHeight * 0.3,
              width: AppConst.kWidth,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConst.kRadius)),
                child: TabBarView(controller: tabController, children: [
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHeight * 0.3,
                    child: ListView(
                      children: [
                        TodoTile(
                          start: "03:00",
                          end: "04:00",
                          switcher: Switch(value: true, onChanged: (value) {}),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: AppConst.kBkLight,
                    height: AppConst.kHeight * 0.3,
                  )
                ]),
              ),
            ),
            const HeightSpacer(height: 20),
            XpansionTile(
                text: "Tomorrow's Task",
                text2: "Tomorrow's Task are shown here",
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionStateProvider.notifier).setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: ref.watch(xpansionStateProvider)
                      ? const Icon(
                          AntDesign.clockcircleo,
                          color: AppConst.kLight,
                        )
                      : const Icon(
                          AntDesign.circledown,
                          color: AppConst.kBlueLight,
                        ),
                ),
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "04:00",
                    switcher: Switch(value: true, onChanged: (value) {}),
                  )
                ]),
            const HeightSpacer(height: 20),
            XpansionTile(
                text: DateTime.now()
                    .add(const Duration(days: 2))
                    .toString()
                    .substring(5, 10),
                text2: "Day After Tomorrow's Tasks",
                onExpansionChanged: (bool expanded) {
                  ref.read(xpansionState0Provider.notifier).setStart(!expanded);
                },
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: ref.watch(xpansionState0Provider)
                      ? const Icon(
                          AntDesign.clockcircleo,
                          color: AppConst.kLight,
                        )
                      : const Icon(
                          AntDesign.circledown,
                          color: AppConst.kBlueLight,
                        ),
                ),
                children: [
                  TodoTile(
                    start: "03:00",
                    end: "04:00",
                    switcher: Switch(value: true, onChanged: (value) {}),
                  )
                ])
          ]),
        )));
  }
}
