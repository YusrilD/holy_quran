import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holy_quran/utils/app_colors.dart';
import 'package:holy_quran/utils/extensions/spacing_extension.dart';

import '../../../controller/pray_schedule_controller.dart';
import '../../../utils/constant.dart';

class PrayScreen extends StatelessWidget {
  PrayScreen({super.key});

  var prayScheduleC = Get.find<PrayScheduleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () {
          return Column(
            children: [
              kToolbarHeight.verticalSpace,
              _calendar(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: List.generate(
                      prayScheduleC.listOfPraySchedule.length, (index) {
                    var item = prayScheduleC.listOfPraySchedule[index];
                    return ListTile(
                      title: Text("${item.tanggal}"),
                      subtitle: Text("${item.shubuh}"),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _calendar() {
    final daysInMonth = prayScheduleC.getDaysInMonth(
        prayScheduleC.theDate.value.year, prayScheduleC.theDate.value.month);
    final startDay = prayScheduleC.getStartingWeekday(
        prayScheduleC.theDate.value.year, prayScheduleC.theDate.value.month);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                prayScheduleC.changeMonth(true);
              },
              child: const CircleAvatar(
                maxRadius: 20,
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
            ),
            Text(
              "${months[prayScheduleC.theDate().month - 1]} ${prayScheduleC.theDate().year}",
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            InkWell(
              onTap: () {
                prayScheduleC.changeMonth(false);
              },
              child: const CircleAvatar(
                maxRadius: 20,
                child: Icon(
                  Icons.chevron_right,
                ),
              ),
            ),
          ],
        ).paddingAll(8),
        16.0.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"]
              .map((day) => Text(day))
              .toList(),
        ),
        8.0.verticalSpace,
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: daysInMonth.length + startDay - 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index < startDay - 1) {
              return const SizedBox(); // Empty cells for days before the first of the month
            } else {
              final day = daysInMonth[index - startDay + 1];

              return Stack(
                children: [
                  const SizedBox(
                    width: 15,
                    height: 15,
                  ),
                  Obx(
                    () {
                      bool isToday = prayScheduleC.checkIsToday(
                          day, prayScheduleC.theDate.value);
                      if (isToday) {
                        return const Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.circle,
                              color: Color(AppColor.primary),
                              size: 35,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Align(
                            alignment: Alignment.center,
                            child: Obx(
                              () {
                                bool isToday = prayScheduleC.checkIsToday(
                                  day,
                                  prayScheduleC.theDate.value,
                                );
                                return Text(
                                  "${day.day}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: isToday
                                        ? Colors.white
                                        : const Color(AppColor.secondary),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    ).paddingAll(0).paddingAll(0);
  }
}
