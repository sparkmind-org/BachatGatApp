import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../models/meeting.dart';
import '../data/meeting_data_source.dart';

class EnhancedCalendarView extends StatelessWidget {
  final List<Meeting> meetings;
  final Function(Meeting, int) onMeetingTap;

  const EnhancedCalendarView({
    super.key,
    required this.meetings,
    required this.onMeetingTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(meetings),
          todayHighlightColor: Colors.blue[700],
          cellBorderColor: Colors.grey[100],
          backgroundColor: Colors.white,
          onTap: (details) {
            if (details.appointments != null && details.appointments!.isNotEmpty) {
              final meeting = details.appointments![0] as Meeting;
              final index = meetings.indexOf(meeting);
              onMeetingTap(meeting, index);
            }
          },
          headerStyle: CalendarHeaderStyle(
            textAlign: TextAlign.center,
            backgroundColor: Colors.blue[700],
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          viewHeaderStyle: ViewHeaderStyle(
            backgroundColor: Colors.grey[50],
            dayTextStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
          monthViewSettings: MonthViewSettings(
            showAgenda: true,
            agendaViewHeight: 200,
            agendaItemHeight: 70,
            monthCellStyle: MonthCellStyle(
              backgroundColor: Colors.white,
              todayBackgroundColor: Colors.blue[50],
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF2C3E50),
                fontWeight: FontWeight.w500,
              ),
              trailingDatesTextStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
              leadingDatesTextStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
              ),
            ),
            agendaStyle: AgendaStyle(
              backgroundColor: Colors.grey[50],
              appointmentTextStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              dayTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
              ),
              dateTextStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
            ),
          ),
        ),
      ),
    );
  }
}