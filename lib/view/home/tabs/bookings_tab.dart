import 'package:flutter/material.dart';

import '../../../components/network_image_fallback.dart';

class BookingsTab extends StatefulWidget {
  const BookingsTab({Key? key}) : super(key: key);

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  bool _isUpcoming = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildHeader(),
            const SizedBox(height: 24),
            _buildTabSelector(),
            const SizedBox(height: 24),
            // The list of bookings
            _buildBookingCard(
              imageUrl: 'https://images.unsplash.com/photo-1596895111956-bf128ce8e529?q=80&w=1000&auto=format&fit=crop', // placeholder boat image
              status: 'CONFIRMED',
              statusColor: const Color(0xFF00C853), // Green
              bookingId: 'RB-0020-GA',
              title: 'Ganga Soul Boat',
              location: 'Assi Ghat, Varanasi',
              date: '24 Oct, 2023',
              time: '05:30 AM',
              members: '04 Persons',
              iconType: Icons.sailing_outlined,
            ),
            const SizedBox(height: 20),
            _buildBookingCard(
              imageUrl: 'https://images.unsplash.com/photo-1596401057633-54a8fea69be3?q=80&w=1000&auto=format&fit=crop', // placeholder aarti image
              status: 'PENDING',
              statusColor: const Color(0xFFFF9800), // Orange
              bookingId: 'RB-9041-EA',
              title: 'Evening Aarti Special',
              location: 'Dashashwamedh Ghat',
              date: '26 Oct, 2023',
              time: '06:15 PM',
              members: '02 Persons',
              iconType: Icons.auto_awesome,
            ),
            const SizedBox(height: 20),
            _buildCountdownCard(),
            const SizedBox(height: 30), // Bottom padding
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF8F9FA),
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF1E3A5F)),
        onPressed: () {},
      ),
      title: RichText(
        text: const TextSpan(
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          children: [
            TextSpan(
              text: 'River ',
              style: TextStyle(color: Color(0xFF1E3A5F)), // Dark Blue
            ),
            TextSpan(
              text: 'Buzz',
              style: TextStyle(color: Color(0xFFE69A0B)), // Orange/Yellowish
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Color(0xFF1E3A5F)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Spiritual\nJourneys',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E3A5F),
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Manage your sacred voyages and revisit\nyour history with the holy waters.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildTabSelector() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isUpcoming = true),
              child: Container(
                decoration: BoxDecoration(
                  color: _isUpcoming ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: _isUpcoming
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    fontWeight: _isUpcoming ? FontWeight.bold : FontWeight.w500,
                    color: _isUpcoming ? const Color(0xFF1E3A5F) : Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _isUpcoming = false),
              child: Container(
                decoration: BoxDecoration(
                  color: !_isUpcoming ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: !_isUpcoming
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  'History',
                  style: TextStyle(
                    fontWeight: !_isUpcoming ? FontWeight.bold : FontWeight.w500,
                    color: !_isUpcoming ? const Color(0xFF1E3A5F) : Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String imageUrl,
    required String status,
    required Color statusColor,
    required String bookingId,
    required String title,
    required String location,
    required String date,
    required String time,
    required String members,
    required IconData iconType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F9), // Very light bluish-grey card background matching image
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          Stack(
            children: [
              NetworkImageWithFallbacks(
                urls: buildImageUrlChain(imageUrl),
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator(color: Colors.grey)),
                  );
                },
                errorWidget: Container(
                  height: 160,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.error_outline, color: Colors.grey, size: 40),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content Profile
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ID Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID: $bookingId',
                      style: const TextStyle(
                        color: Color(0xFFb86614), // Orange shade
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    Icon(iconType, color: Colors.grey.shade400, size: 20),
                  ],
                ),
                const SizedBox(height: 8),
                // Title & Location
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey.shade500, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Details Grid
                Row(
                  children: [
                    Expanded(
                      child: _buildDetailCol('DATE', date),
                    ),
                    Expanded(
                      child: _buildDetailCol('TIME', time),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildDetailCol('MEMBERS', members),
                
                const SizedBox(height: 24),
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E3A5F), // Dark blue
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Modify Journey', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 100,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.red,
                          side: BorderSide(color: Colors.red.shade100),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.red), // Red border
                          ),
                        ),
                        child: const Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailCol(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildCountdownCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE89E28), // Orange
            Color(0xFF2C4A6B), // Dark blue
            Color(0xFF1E3A5F), // Darker blue
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Optional: Add a subtle watermark icon/image on bottom right if we had an asset
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.temple_hindu,
              size: 180,
              color: Colors.white.withOpacity(0.05),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'AARTI RITUAL COUNTDOWN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Prepare for\nthe Divine\nEvening Aarti',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Your next spiritual experience\nstarts in just 4 hours. Don\'t miss\nthe celestial vibration.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                // Timer Row
                Row(
                  children: [
                    _buildTimerUnit('04', 'HOURS'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(':', style: TextStyle(color: Colors.white54, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    _buildTimerUnit('12', 'MINS'),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(':', style: TextStyle(color: Colors.white54, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                    _buildTimerUnit('45', 'SECS'),
                  ],
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity, // Adjust based on design, seems partly full width or constrained
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1E3A5F),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'GET DIRECTIONS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 13,
                      ),
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

  Widget _buildTimerUnit(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ],
    );
  }
}
