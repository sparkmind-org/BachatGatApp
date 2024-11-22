import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../../widgets/custom_footer.dart';
import '../../../widgets/custom_app_bar.dart';

class ScheduleMeetingScreen extends StatefulWidget {
  const ScheduleMeetingScreen({super.key});

  @override
  ScheduleMeetingScreenState createState() => ScheduleMeetingScreenState();
}

class ScheduleMeetingScreenState extends State<ScheduleMeetingScreen> {
  int _selectedIndex = 2;
  final List<Meeting> _meetings = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/members');
        break;
      case 2:
        Navigator.pushNamed(context, '/add');
        break;
      case 3:
        Navigator.pushNamed(context, '/reports');
        break;
      case 4:
        Navigator.pushNamed(context, '/menu');
        break;
    }
  }

  void _addOrEditMeeting({Meeting? meeting, int? index}) {
    String title = meeting?.title ?? '';
    String description = meeting?.description ?? '';
    DateTime selectedDate = meeting?.from ?? DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.fromDateTime(meeting?.from ?? DateTime.now());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(meeting == null ? 'Add Meeting' : 'Edit Meeting'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Meeting Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(labelText: 'Meeting Title'),
                  controller: TextEditingController(text: title),
                  onChanged: (value) => title = value,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  controller: TextEditingController(text: description),
                  onChanged: (value) => description = value,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Schedule',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date: ${selectedDate.toLocal()}'.split(' ')[0]),
                    TextButton(
                      onPressed: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() => selectedDate = pickedDate);
                        }
                      },
                      child: const Text('Select Date'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Time: ${selectedTime.format(context)}'),
                    TextButton(
                      onPressed: () async {
                        final pickedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTime,
                        );
                        if (pickedTime != null) {
                          setState(() => selectedTime = pickedTime);
                        }
                      },
                      child: const Text('Select Time'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            if (meeting != null)
              TextButton(
                onPressed: () => _confirmCancelMeeting(index!),
                child: const Text('Cancel Meeting'),
              ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                if (title.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Title cannot be empty')),
                  );
                  return;
                }
                final newMeeting = Meeting(
                  title: title,
                  description: description,
                  from: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  ),
                  to: DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour + 1,
                    selectedTime.minute,
                  ),
                );
                setState(() {
                  if (meeting == null) {
                    _meetings.add(newMeeting);
                  } else {
                    _meetings[index!] = newMeeting;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text(meeting == null ? 'Add Meeting' : 'Save Changes'),
            ),
          ],
        );
      },
    );
  }

  void _confirmCancelMeeting(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cancel Meeting'),
          content: const Text('Are you sure you want to cancel this meeting?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _meetings.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomAppBar(
        title: 'Schedule Meeting',
        showBackButton: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SfCalendar(
                view: CalendarView.month,
                dataSource: MeetingDataSource(_meetings),
                todayHighlightColor: Colors.blue,
                onTap: (details) {
                  if (details.appointments != null && details.appointments!.isNotEmpty) {
                    final meeting = details.appointments![0] as Meeting;
                    final index = _meetings.indexOf(meeting);
                    _addOrEditMeeting(meeting: meeting, index: index);
                  }
                },
                headerStyle: const CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                viewHeaderStyle: const ViewHeaderStyle(
                  dayTextStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                monthViewSettings: const MonthViewSettings(
                  showAgenda: true,
                  agendaViewHeight: 150,
                  agendaItemHeight: 50,
                  agendaStyle: AgendaStyle(
                    appointmentTextStyle: TextStyle(fontSize: 14),
                    dayTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _addOrEditMeeting(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Add Meeting'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_meetings.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No meetings to schedule.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Meetings scheduled successfully!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Schedule Meeting'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(
        currentIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _onItemTapped(index);
        },
      ),
    );
  }
}

class Meeting {
  String title;
  String description;
  DateTime from;
  DateTime to;

  Meeting({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
  });
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> meetings) {
    appointments = meetings;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].title;
  }

  @override
  Color getColor(int index) {
    return Colors.blue;
  }
}
