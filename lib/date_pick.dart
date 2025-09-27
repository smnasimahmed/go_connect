import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/date_pick_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePick extends StatelessWidget {
  const DatePick({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickController>(
      init: DatePickController(),
      builder: (controller) {
        return SfDateRangePicker(
          headerStyle: DateRangePickerHeaderStyle(backgroundColor: Colors.white),
          controller: controller.pickerController,
          backgroundColor: Colors.white,
          selectionColor: Colors.white,
          selectionMode: DateRangePickerSelectionMode.range,
          minDate: DateTime.now(),
          maxDate: DateTime(
            DateTime.now().year,
            DateTime.now().month + 2,
            DateTime.now().day,
          ),
          monthViewSettings: DateRangePickerMonthViewSettings(
            blackoutDates: controller.blackoutDates,
          ),
          monthCellStyle: const DateRangePickerMonthCellStyle(
            blackoutDateTextStyle: TextStyle(color: Colors.grey),
          ),
          showActionButtons: true,
          showNavigationArrow: true,
          onSelectionChanged: controller.onSelectionChanged,
          onSubmit: (Object? value) {
            controller.saveRange();
          },
          onCancel: () {
            controller.clearSelection();
          },
          onViewChanged: controller.updateBlackout,
        );
      },
    );
  }
}
