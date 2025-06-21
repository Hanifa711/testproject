import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myshop/controller/home/mybag_controller.dart';
import 'custom_date_picker_dialog.dart';

class DateAndTimePickerWidget extends StatelessWidget {
  const DateAndTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyBagController>();
    return GetBuilder<MyBagController>(
      builder:
          (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    final picked = await showCustomDatePickerDialog(
                      context,
                      controller.selectedDate,
                    );
                    if (picked != null) controller.setDate(picked);
                  },
                  icon: Icon(Icons.calendar_month, color: Colors.grey[700]),
                  label: Text(
                    controller.selectedDate != null
                        ? DateFormat(
                          'EEE, MMM d',
                        ).format(controller.selectedDate!)
                        : "Select Date",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300, width: 1.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.timeSlots.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 9,
                  crossAxisSpacing: 9,
                  childAspectRatio: 2.7,
                ),
                itemBuilder: (context, idx) {
                  final isSelected = controller.selectedTimeIndex == idx;
                  return GestureDetector(
                    onTap: () {
                      controller.setTime(idx);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Color(0xffe8fff0) : Colors.grey[100],
                        border: Border.all(
                          color:
                              isSelected
                                  ? Color(0xff5EC401)
                                  : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        controller.timeSlots[idx],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected ? Color(0xff5EC401) : Colors.grey[700],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
    );
  }
}
