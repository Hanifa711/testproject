import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> showCustomDatePickerDialog(
  BuildContext context,
  DateTime? initialDate,
) async {
  DateTime today = DateTime.now();
  DateTime selected = initialDate ?? today;
  DateTime firstDate = today;
  DateTime lastDate = today.add(Duration(days: 30));
  DateTime? result = initialDate;

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
        backgroundColor: Colors.transparent,
        child: StatefulBuilder(
          builder:
              (context, setState) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF7F22),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SELECT DATE",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                DateFormat('EEE, MMM d').format(selected),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.edit, color: Colors.white),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      child: CalendarDatePicker(
                        initialDate: selected,
                        firstDate: firstDate,
                        lastDate: lastDate,
                        onDateChanged: (val) {
                          setState(() {
                            selected = val;
                            result = val;
                          });
                        },
                      ),
                    ),
                    Divider(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, null),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () => Navigator.pop(context, result),
                          child: Text(
                            "Okay",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
        ),
      );
    },
  ).then((value) {
    if (value is DateTime) result = value;
  });

  return result;
}
