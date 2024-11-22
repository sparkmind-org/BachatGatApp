import 'package:flutter/material.dart';
import '../models/meeting.dart';

class MeetingFormDialog extends StatefulWidget {
  final Meeting? meeting;
  final int? index;
  final Function(Meeting meeting) onSave;
  final Function()? onDelete;

  const MeetingFormDialog({
    super.key,
    this.meeting,
    this.index,
    required this.onSave,
    this.onDelete,
  });

  @override
  State<MeetingFormDialog> createState() => _MeetingFormDialogState();
}

class _MeetingFormDialogState extends State<MeetingFormDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _selectedDate;
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.meeting?.title ?? '');
    _descriptionController = TextEditingController(text: widget.meeting?.description ?? '');
    _selectedDate = widget.meeting?.from ?? DateTime.now();
    _selectedTime = TimeOfDay.fromDateTime(widget.meeting?.from ?? DateTime.now());
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.meeting == null ? 'New Meeting' : 'Edit Meeting',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Meeting Title',
                  hintText: 'Enter meeting title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.event),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter meeting description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50]!.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue[100]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: const Text('Date'),
                      subtitle: Text(
                        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: _selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (date != null) {
                          setState(() => _selectedDate = date);
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: const Text('Time'),
                      subtitle: Text(_selectedTime.format(context)),
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _selectedTime,
                        );
                        if (time != null) {
                          setState(() => _selectedTime = time);
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (widget.onDelete != null)
                    Expanded(
                      child: TextButton.icon(
                        onPressed: widget.onDelete,
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        label: const Text('Delete'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  if (widget.onDelete != null)
                    const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a title')),
                          );
                          return;
                        }
                        final DateTime meetingDate = DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        );
                        final newMeeting = Meeting(
                          id: widget.meeting?.id ?? DateTime.now().toString(),
                          title: _titleController.text,
                          description: _descriptionController.text,
                          from: meetingDate,
                          to: meetingDate.add(const Duration(hours: 1)),
                        );
                        widget.onSave(newMeeting);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        widget.meeting == null ? 'Create Meeting' : 'Save Changes',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}