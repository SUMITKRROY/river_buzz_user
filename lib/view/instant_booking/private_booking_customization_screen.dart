import 'package:flutter/material.dart';
import 'package:river_buzz_user/utils/common_string.dart';
import 'package:river_buzz_user/utils/date_time_utils.dart';

import 'private_booking_request_sent_screen.dart';

class PrivateBookingCustomizationScreen extends StatefulWidget {
  const PrivateBookingCustomizationScreen({
    super.key,
    required this.membersCount,
    required this.boatName,
    required this.boatPrice,
  });

  final int membersCount;
  final String boatName;
  final int boatPrice;

  @override
  State<PrivateBookingCustomizationScreen> createState() =>
      _PrivateBookingCustomizationScreenState();
}

class _PrivateBookingCustomizationScreenState
    extends State<PrivateBookingCustomizationScreen> {
  bool gangaAarti = true;
  bool floralDecoration = false;
  bool spiritualGuide = false;
  late final DateTime _bookingTime;

  @override
  void initState() {
    super.initState();
    _bookingTime = DateTime.now();
  }

  int get _total {
    var total = widget.boatPrice;
    if (gangaAarti) total += 20;
    if (floralDecoration) total += 15;
    if (spiritualGuide) total += 40;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F7F9),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Customize Your Event',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              children: [
                Row(
                  children: [
                    const Text(
                      'Step 2 of 3',
                      style: TextStyle(
                        color: Color(0xFFE89B12),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Almost there',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: 0.67,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFFE89B12)),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=400&auto=format&fit=crop',
                          width: 86,
                          height: 86,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.boatName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              formatBookingDateTime(_bookingTime),
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Varanasi, India',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Enhance your journey',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select premium add-ons for your trip.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ),
                const SizedBox(height: 14),
                _AddonTile(
                  title: 'Ganga Aarti View',
                  description: 'Prime spot for evening prayers.',
                  price: 20,
                  imageUrl:
                      'https://images.unsplash.com/photo-1571679654681-ba01b9e1e117?w=300&auto=format&fit=crop',
                  value: gangaAarti,
                  highlight: true,
                  onChanged: (value) => setState(() => gangaAarti = value),
                ),
                const SizedBox(height: 12),
                _AddonTile(
                  title: 'Floral Decorations',
                  description: 'Marigold arrangements for ambiance.',
                  price: 15,
                  imageUrl:
                      'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=300&auto=format&fit=crop',
                  value: floralDecoration,
                  onChanged: (value) => setState(() => floralDecoration = value),
                ),
                const SizedBox(height: 12),
                _AddonTile(
                  title: 'Spiritual Guide',
                  description: 'Expert historian to narrate myths.',
                  price: 40,
                  imageUrl:
                      'https://images.unsplash.com/photo-1601979031925-424e53b6caaa?w=300&auto=format&fit=crop',
                  value: spiritualGuide,
                  onChanged: (value) => setState(() => spiritualGuide = value),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Add Special Request',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'e.g. Wheelchair access needed, food allergies...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Total estimate',
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                      CommonString.rupee(_total),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PrivateBookingRequestSentScreen(
                            title: widget.boatName,
                            total: _total.toDouble(),
                            guestCount: widget.membersCount,
                            pickupPoint: 'Varanasi, India',
                            bookingTime: _bookingTime,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF0A112),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Text(
                      'Save & Continue',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class _AddonTile extends StatelessWidget {
  const _AddonTile({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.value,
    required this.onChanged,
    this.highlight = false,
  });

  final String title;
  final String description;
  final int price;
  final String imageUrl;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: highlight
            ? Border.all(color: const Color(0xFFF0A112), width: 1.4)
            : null,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                const SizedBox(height: 3),
                Text(
                  '+${CommonString.rupee(price)}',
                  style: const TextStyle(
                    color: Color(0xFFE89B12),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFFF0A112),
          ),
        ],
      ),
    );
  }
}
