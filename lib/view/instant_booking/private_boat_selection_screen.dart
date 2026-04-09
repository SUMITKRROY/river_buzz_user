import 'package:flutter/material.dart';

import '../../utils/common_string.dart';
import '../../utils/image_string.dart';
import 'private_booking_customization_screen.dart';

class PrivateBoatSelectionScreen extends StatelessWidget {
  const PrivateBoatSelectionScreen({super.key, required this.membersCount});

  final int membersCount;

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
          'Select Your Vessel',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 24),
          children: [
            const Text(
              'PILGRIMAGE COMFORT',
              style: TextStyle(
                color: Color(0xFF9A835F),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose your\nvessel for the\nsacred waters',
              style: TextStyle(
                color: Color(0xFF101820),
                fontSize: 38,
                fontWeight: FontWeight.w800,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'For $membersCount pilgrims, choose the boat that best suits your spiritual journey.',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 14,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            _BoatCard(
              membersCount: membersCount,
              title: 'Small Boat',
              subtitle: '4 members',
              type: 'Bajra',
              amount: 1200,
              badge: 'INTIMATE',
              badgeColor: const Color(0xFF113865),
              imagePath: ImageString.smallBoat,
            ),
            const SizedBox(height: 16),
            _BoatCard(
              membersCount: membersCount,
              title: 'Medium Boat',
              subtitle: '8 members',
              type: 'Bajra',
              amount: 2500,
              badge: 'MOST POPULAR',
              badgeColor: const Color(0xFFF4B23F),
              imagePath: ImageString.mediumBoat,
            ),
            const SizedBox(height: 16),
            _BoatCard(
              membersCount: membersCount,
              title: 'Large Boat',
              subtitle: '15 members',
              type: 'Vessel',
              amount: 4500,
              badge: 'GROUP EVENTS',
              badgeColor: const Color(0xFFC63A32),
              imagePath: ImageString.largeBoat,
            ),
          ],
        ),
      ),
    );
  }
}

class _BoatCard extends StatelessWidget {
  const _BoatCard({
    required this.membersCount,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.amount,
    required this.badge,
    required this.badgeColor,
    required this.imagePath,
  });

  final int membersCount;
  final String title;
  final String subtitle;
  final String type;
  final int amount;
  final String badge;
  final Color badgeColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  badge,
                  style: TextStyle(
                    color: badge == 'MOST POPULAR' ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 9,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Starting from',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '${CommonString.rupeeSymbol}$amount',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '$title ($type)',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PrivateBookingCustomizationScreen(
                      membersCount: membersCount,
                      boatName: '$title ($type)',
                      boatPrice: amount,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E203A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
              ),
              child: const Text(
                'Select Vessel',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
