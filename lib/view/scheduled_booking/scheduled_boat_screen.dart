import 'package:flutter/material.dart';
import 'package:river_buzz_user/view/scheduled_booking/scheduled_ritual_selection_screen.dart';

class ScheduledBoatScreen extends StatefulWidget {
  const ScheduledBoatScreen({super.key});

  @override
  State<ScheduledBoatScreen> createState() => _ScheduledBoatScreenState();
}

class _ScheduledBoatScreenState extends State<ScheduledBoatScreen> {
  late final DateTime _today;
  late final DateTime _firstAllowedMonth;
  late final DateTime _lastAllowedMonth;
  late DateTime _visibleMonth;
  late DateTime _selectedDate;
  int selectedTimeSlot = 1;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    _firstAllowedMonth = DateTime(_today.year, _today.month, 1);
    // Current month + next 5 months = 6 months total range.
    _lastAllowedMonth = DateTime(_today.year, _today.month + 5, 1);
    _visibleMonth = _firstAllowedMonth;
    _selectedDate = _today;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F5F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        title: const Text(
          'Varanasi',
          style: TextStyle(
            color: Color(0xFF10223B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Text(
                '₹1,250',
                style: TextStyle(
                  color: Color(0xFF10223B),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Book Your',
                style: TextStyle(
                  color: Color(0xFF10223B),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                ),
              ),
              const Text(
                'Spiritual Path',
                style: TextStyle(
                  color: Color(0xFFE7A420),
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  height: 0.95,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Select a sacred window to experience the divine rituals on the banks of the Ganges.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 14,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 14),
              _buildSteps(),
              const SizedBox(height: 16),
              _buildCalendarCard(),
              const SizedBox(height: 14),
              const Text(
                'Select Time of Day',
                style: TextStyle(
                  color: Color(0xFF111827),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _timeCard(
                icon: Icons.wb_sunny_outlined,
                title: 'Morning',
                timing: '05:00 AM - 10:00 AM',
                location: 'Assi Ghat Side',
                selected: selectedTimeSlot == 0,
                popular: true,
                onTap: () => setState(() => selectedTimeSlot = 0),
              ),
              const SizedBox(height: 10),
              _timeCard(
                icon: Icons.wb_twilight_outlined,
                title: 'Afternoon',
                timing: '12:00 PM - 04:00 PM',
                location: 'Selected',
                selected: selectedTimeSlot == 1,
                onTap: () => setState(() => selectedTimeSlot = 1),
              ),
              const SizedBox(height: 10),
              _timeCard(
                icon: Icons.nightlight_round,
                title: 'Evening',
                timing: '06:00 PM - 09:00 PM',
                location: 'Ganga Aarti',
                selected: selectedTimeSlot == 2,
                onTap: () => setState(() => selectedTimeSlot = 2),
              ),
              const SizedBox(height: 12),
              _offerCard(),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ScheduledRitualSelectionScreen(
                        selectedDate: _selectedDate,
                        timeOfDayLabel: _selectedTimeLabel,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF12345B),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Proceed to Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      'Step 1/2',
                      style: TextStyle(
                        color: Color(0xFFE7A420),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.arrow_forward_rounded, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSteps() {
    return Row(
      children: [
        _stepDot(number: 1, title: 'Schedule', active: true),
        Expanded(
          child: Divider(color: Colors.grey.shade300, thickness: 1, indent: 10, endIndent: 10),
        ),
        _stepDot(number: 2, title: 'Details', active: false),
      ],
    );
  }

  Widget _stepDot({required int number, required String title, required bool active}) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFE7A420) : const Color(0xFFE5E7EB),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                color: active ? Colors.white : Colors.grey.shade600,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: TextStyle(
            color: active ? const Color(0xFF111827) : Colors.grey.shade500,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarCard() {
    final firstDayOfMonth = DateTime(_visibleMonth.year, _visibleMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(_visibleMonth.year, _visibleMonth.month);
    final leadingEmpty = firstDayOfMonth.weekday % 7;
    final canGoPrevious = _visibleMonth.isAfter(_firstAllowedMonth);
    final canGoNext = _visibleMonth.isBefore(_lastAllowedMonth);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _monthLabel(_visibleMonth),
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF111827),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: canGoPrevious
                    ? () => setState(() {
                        _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1, 1);
                      })
                    : null,
                child: Icon(
                  Icons.chevron_left,
                  color: canGoPrevious ? Colors.grey.shade500 : Colors.grey.shade300,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: canGoNext
                    ? () => setState(() {
                        _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1, 1);
                      })
                    : null,
                child: Icon(
                  Icons.chevron_right,
                  color: canGoNext ? Colors.grey.shade500 : Colors.grey.shade300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Choose your date of arrival',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
                .map(
                  (day) => Text(
                    day,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: leadingEmpty + daysInMonth,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              if (index < leadingEmpty) {
                return const SizedBox.shrink();
              }

              final day = index - leadingEmpty + 1;
              final date = DateTime(_visibleMonth.year, _visibleMonth.month, day);
              final isPast = date.isBefore(_today);
              final isSelected = _isSameDate(date, _selectedDate);

              return GestureDetector(
                onTap: isPast ? null : () => setState(() => _selectedDate = date),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE7A420) : const Color(0xFFF6F7F9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? const Color(0xFFE7A420) : Colors.transparent,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : (isPast ? Colors.grey.shade400 : const Color(0xFF111827)),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _monthLabel(DateTime month) {
    const monthNames = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${monthNames[month.month - 1]} ${month.year}';
  }

  bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String get _selectedTimeLabel {
    if (selectedTimeSlot == 0) return 'Morning';
    if (selectedTimeSlot == 1) return 'Afternoon';
    return 'Evening';
  }

  Widget _timeCard({
    required IconData icon,
    required String title,
    required String timing,
    required String location,
    required bool selected,
    required VoidCallback onTap,
    bool popular = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF10223B) : Colors.transparent,
            width: selected ? 1.3 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF10223B), size: 20),
                const Spacer(),
                if (popular)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBE9C5),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const Text(
                      'POPULAR',
                      style: TextStyle(
                        color: Color(0xFFC28715),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF111827),
                fontSize: 30,
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              timing,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  selected ? Icons.check_circle : Icons.location_on_outlined,
                  size: 14,
                  color: selected ? Colors.black87 : Colors.grey.shade600,
                ),
                const SizedBox(width: 5),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _offerCard() {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: const Color(0xFF0E4470),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sacred Boat Ride',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Included in your session',
                    style: TextStyle(color: Color(0xFFC7DBEA), fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 110,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A76AB),
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ],
      ),
    );
  }
}
