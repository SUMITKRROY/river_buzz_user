import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Large Circle Background
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Text in Center
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            membersCount.toString().padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1A3B52), // Dark Navy
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
                      // Minus Button
                      Positioned(
                        left: 0,
                        child: GestureDetector(
                          onTap: _decrement,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.remove, color: Color(0xFF1E3A5F), size: 30),
                          ),
                        ),
                      ),
                      // Plus Button
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: _increment,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A3B52), // Dark Navy
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1A3B52).withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Perfect Pairing Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1596401057633-54a8fea69be3?q=80&w=400&auto=format&fit=crop',
                        height: 60,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
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
              
              const Spacer(),
              
              // Confirm Button
              GestureDetector(
                onTap: () {
                  // Simulate showing result (can pop back to home and show snackbar)
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirmation'),
                      content: Text('Membership confirmed for $membersCount pilgrims!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close dialog
                            Navigator.pop(context); // Pop MembersSelectionScreen
                          },
                          child: const Text('OK'),
                        )
                      ],
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
      ),
    );
  }
}
