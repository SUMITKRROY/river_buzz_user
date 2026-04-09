import 'package:flutter/material.dart';
import 'private_boat_selection_screen.dart';

class MembersSelectionScreen extends StatefulWidget {
  const MembersSelectionScreen({super.key});

  @override
  State<MembersSelectionScreen> createState() => _MembersSelectionScreenState();
}

class _MembersSelectionScreenState extends State<MembersSelectionScreen> {
  int membersCount = 4;

  void _increment() {
    setState(() {
      membersCount++;
    });
  }

  void _decrement() {
    if (membersCount > 1) {
      setState(() {
        membersCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E3A5F)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Sacred Journey',
          style: TextStyle(
            color: Color(0xFF1E3A5F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          children: [
              const Text(
                'How many\nmembers are\njoining?',
                style: TextStyle(
                  color: Color(0xFF1E3A5F), // Dark navy
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Select the number of travelers for your\nprivate sanctuary on the river.',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 48),
              
              // Member Selector
              LayoutBuilder(
                builder: (context, constraints) {
                  const buttonSize = 60.0;
                  const gap = 12.0;
                  final availableForCircle =
                      constraints.maxWidth - (buttonSize * 2) - (gap * 2);
                  final circleSize = availableForCircle.clamp(180.0, 220.0);
                  final numberFontSize =
                      (circleSize * 0.33).clamp(56.0, 72.0).toDouble();

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _decrement,
                        child: Container(
                          width: buttonSize,
                          height: buttonSize,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.remove, color: Color(0xFF1E3A5F), size: 30),
                        ),
                      ),
                      const SizedBox(width: gap),
                      Container(
                        width: circleSize,
                        height: circleSize,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              membersCount.toString().padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: numberFontSize,
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF1A3B52), // Dark Navy
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'PILGRIMS',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B5A2B), // Brownish
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: gap),
                      GestureDetector(
                        onTap: _increment,
                        child: Container(
                          width: buttonSize,
                          height: buttonSize,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A3B52), // Dark Navy
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1A3B52).withValues(alpha: 0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.add, color: Colors.white, size: 30),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 48),

              // Perfect Pairing Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    // ClipRRect(
                    //   borderRadius: const BorderRadius.vertical(
                    //     top: Radius.circular(24),
                    //   ),
                    //   child: Image.asset(
                    //     'assets/images/event_boat.jpg',
                    //     height: 96,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
                      child: Column(
                        children: [
                          const Text(
                            'Perfect Pairing',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A3B52),
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                                height: 1.4,
                              ),
                              children: [
                                TextSpan(text: 'Based on your group of $membersCount, we recommend our '),
                                const TextSpan(
                                  text: 'Medium Luxury Boat',
                                  style: TextStyle(
                                    color: Color(0xFF8B5A2B),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(text: ' for optimal comfort and spiritual focus.'),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Icon(Icons.auto_awesome, color: Colors.orange, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Confirm Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          PrivateBoatSelectionScreen(membersCount: membersCount),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF2A5972), // Teal-blueish
                        Color(0xFFD6943C), // Orange-gold
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm Membership',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'You can adjust group details later in your journey itinerary.',
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
        ),
      ),
    );
  }
}
