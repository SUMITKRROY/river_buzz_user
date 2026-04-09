import 'package:flutter/material.dart';

import '../instant_booking/private_booking_request_sent_screen.dart';

class ScheduledRitualSelectionScreen extends StatefulWidget {
  const ScheduledRitualSelectionScreen({
    super.key,
    required this.selectedDate,
    required this.timeOfDayLabel,
  });

  final DateTime selectedDate;
  final String timeOfDayLabel;

  @override
  State<ScheduledRitualSelectionScreen> createState() =>
      _ScheduledRitualSelectionScreenState();
}

class _ScheduledRitualSelectionScreenState
    extends State<ScheduledRitualSelectionScreen> {
  int _selectedRitual = 0;
  int _selectedGhat = 0;

  static const List<_RitualItem> _rituals = [
    _RitualItem(
      title: 'Evening Aarti',
      subtitle: 'Ganga Aarti at Sunset',
      badge: 'MOST POPULAR',
      imagePath: 'assets/images/evening_arti.jpg',
    ),
    _RitualItem(
      title: 'Morning Aarti',
      subtitle: 'Subah-e-Banaras Rituals',
      badge: null,
      imagePath: 'assets/images/sun_set.jpg',
    ),
  ];

  static const List<_GhatItem> _ghats = [
    _GhatItem(
      name: 'Dashashwamedh Ghat',
      tag: 'MAIN AARTI',
      timeLabel: '06:45 PM',
      imagePath: 'assets/images/dasasume_ghat.jpg',
    ),
    _GhatItem(
      name: 'Assi Ghat',
      tag: 'CULTURAL',
      timeLabel: '05:30 AM',
      imagePath: 'assets/images/evening_ghat.jpg',
    ),
    _GhatItem(
      name: 'Manikarnika Ghat',
      tag: 'HERITAGE',
      timeLabel: '07:15 PM',
      imagePath: 'assets/images/mankarnika_ghat_2nd.jpg',
    ),
  ];

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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Divine Aarti',
                      style: TextStyle(
                        color: Color(0xFF0D274A),
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        height: 0.92,
                      ),
                    ),
                    const Text(
                      'Experiences',
                      style: TextStyle(
                        color: Color(0xFF8A5A00),
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        height: 0.92,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Connect with the eternal spiritual energy of Kashi through the sacred rituals of the Ganga.',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'अनुष्ठान चयन  / Select Ritual',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(_rituals.length, (index) {
                      final ritual = _rituals[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: index == _rituals.length - 1 ? 0 : 12),
                        child: _ritualCard(
                          ritual: ritual,
                          selected: _selectedRitual == index,
                          onTap: () => setState(() => _selectedRitual = index),
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                    const Text(
                      'घाट और समय',
                      style: TextStyle(
                        color: Color(0xFF111827),
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                        height: 1,
                      ),
                    ),
                    const Text(
                      'Ghats & Timings',
                      style: TextStyle(
                        color: Color(0xFF374151),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(_ghats.length, (index) {
                      final ghat = _ghats[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: index == _ghats.length - 1 ? 0 : 10),
                        child: _ghatTile(
                          ghat: ghat,
                          selected: _selectedGhat == index,
                          onTap: () => setState(() => _selectedGhat = index),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF4F5F7),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final selectedRitual = _rituals[_selectedRitual];
                    final selectedGhat = _ghats[_selectedGhat];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ScheduledBookingPreviewScreen(
                          selectedDate: widget.selectedDate,
                          timeOfDayLabel: widget.timeOfDayLabel,
                          ritualName: selectedRitual.title,
                          ritualSubtitle: selectedRitual.subtitle,
                          ghatName: selectedGhat.name,
                          ghatTiming: selectedGhat.timeLabel,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123F68),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    elevation: 0,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue to Details',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_rounded, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ritualCard({
    required _RitualItem ritual,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            Image.asset(
              ritual.imagePath,
              height: 145,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 145,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
            if (selected)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check_rounded, size: 18, color: Color(0xFF1F2937)),
                ),
              ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (ritual.badge != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3A61C),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        ritual.badge!,
                        style: const TextStyle(
                          color: Color(0xFF3F2B00),
                          fontWeight: FontWeight.w700,
                          fontSize: 9,
                        ),
                      ),
                    ),
                  Text(
                    ritual.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 31,
                      height: 0.95,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    ritual.subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.86),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ghatTile({
    required _GhatItem ghat,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFF1D4B72) : Colors.transparent,
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                ghat.imagePath,
                width: 52,
                height: 52,
                fit: BoxFit.cover,
                color: selected ? null : Colors.grey,
                colorBlendMode: selected ? null : BlendMode.saturation,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ghat.name,
                    style: const TextStyle(
                      color: Color(0xFF111827),
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      height: 0.95,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3A61C),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          ghat.tag,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                            color: Color(0xFF3F2B00),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.watch_later_outlined, size: 13, color: Color(0xFF4B5563)),
                      const SizedBox(width: 4),
                      Text(
                        ghat.timeLabel,
                        style: const TextStyle(
                          color: Color(0xFF4B5563),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? const Color(0xFF1D4B72) : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduledBookingPreviewScreen extends StatelessWidget {
  const ScheduledBookingPreviewScreen({
    super.key,
    required this.selectedDate,
    required this.timeOfDayLabel,
    required this.ritualName,
    required this.ritualSubtitle,
    required this.ghatName,
    required this.ghatTiming,
  });

  final DateTime selectedDate;
  final String timeOfDayLabel;
  final String ritualName;
  final String ritualSubtitle;
  final String ghatName;
  final String ghatTiming;

  @override
  Widget build(BuildContext context) {
    final combinedDateTime = _combineDateAndTime(selectedDate, ghatTiming);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F5F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
        ),
        title: const Text(
          'Booking Preview',
          style: TextStyle(
            color: Color(0xFF111827),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _previewCard(
                      title: 'Ritual',
                      value: ritualName,
                      subtitle: ritualSubtitle,
                    ),
                    const SizedBox(height: 10),
                    _previewCard(
                      title: 'Date',
                      value: _dateLabel(selectedDate),
                    ),
                    const SizedBox(height: 10),
                    _previewCard(
                      title: 'Time of Day',
                      value: timeOfDayLabel,
                    ),
                    const SizedBox(height: 10),
                    _previewCard(
                      title: 'Ghat',
                      value: ghatName,
                      subtitle: ghatTiming,
                    ),
                    const SizedBox(height: 10),
                    _previewCard(
                      title: 'Estimated Total',
                      value: '₹799.00',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PrivateBookingRequestSentScreen(
                          title: ritualName,
                          total: 799,
                          guestCount: 1,
                          pickupPoint: ghatName,
                          bookingTime: combinedDateTime,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF123F68),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Confirm & Send Request',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _previewCard({
    required String title,
    required String value,
    String? subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF111827),
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  DateTime _combineDateAndTime(DateTime date, String time) {
    final compact = time.trim();
    final parts = compact.split(' ');
    if (parts.length != 2) return date;
    final hm = parts[0].split(':');
    if (hm.length != 2) return date;

    var hour = int.tryParse(hm[0]) ?? 0;
    final minute = int.tryParse(hm[1]) ?? 0;
    final isPm = parts[1].toUpperCase() == 'PM';

    if (isPm && hour != 12) hour += 12;
    if (!isPm && hour == 12) hour = 0;

    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  String _dateLabel(DateTime date) {
    const monthNames = <String>[
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${date.day} ${monthNames[date.month - 1]} ${date.year}';
  }
}

class _RitualItem {
  const _RitualItem({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.imagePath,
  });

  final String title;
  final String subtitle;
  final String? badge;
  final String imagePath;
}

class _GhatItem {
  const _GhatItem({
    required this.name,
    required this.tag,
    required this.timeLabel,
    required this.imagePath,
  });

  final String name;
  final String tag;
  final String timeLabel;
  final String imagePath;
}
