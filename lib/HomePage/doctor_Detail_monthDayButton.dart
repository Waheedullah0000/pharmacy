import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ButtonGridScreen extends StatefulWidget {
  const ButtonGridScreen({super.key});

  @override
  _ButtonGridScreenState createState() => _ButtonGridScreenState();
}

class _ButtonGridScreenState extends State<ButtonGridScreen> {
  int selectedDayIndex = 0;
  int selectedTimeIndex = 0;

  final List<String> times = ['09:00 AM', '10:00 AM', '11:00 AM', '01:00 PM', '02:00 PM', '03:00 PM', '04:00 PM', '07:00 PM', '08:00 PM'];

  List<String> monthlyDays = [];

  void _generateMonthlyDays() {
    DateTime now = DateTime.now();
    int daysInMonth = DateTime(now.year, now.month + 1, 0).day;

    monthlyDays = List.generate(daysInMonth, (index) {
      DateTime date = DateTime(now.year, now.month, index + 1);
      return DateFormat('d EEE').format(date);
    });
  }

  @override
  void initState() {
    super.initState();
    _generateMonthlyDays();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Colors.grey.shade300,
              )
            ],
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: monthlyDays.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: selectedDayIndex == index ? Color(0xff19839A) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EEE').format(DateTime.now().add(Duration(days: index))),
                            style: TextStyle(
                              color: selectedDayIndex == index ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat('d').format(DateTime.now().add(Duration(days: index))),
                            style: TextStyle(
                              color: selectedDayIndex == index ? Colors.white : Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 40),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2.5,
          ),
          itemCount: times.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeIndex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedTimeIndex == index ? Color(0xff19839A) : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    times[index],
                    style: TextStyle(
                      color: selectedTimeIndex == index ? Colors.white : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
