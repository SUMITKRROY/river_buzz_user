import 'package:flutter/material.dart';
import 'package:river_buzz_user/view/instant_booking/journey_type_screen.dart';
import 'package:river_buzz_user/view/scheduled_booking/scheduled_boat_screen.dart';

// ---------------------------------------------------------------------------
// Colour tokens (keep in sync with your app_constants.dart)
// ---------------------------------------------------------------------------
const _navy = Color(0xFF0F1E3C);
const _amber = Color(0xFFE69A0B);
const _amberLight = Color(0xFFFFA726);

const String kHeroBannerImage = 'assets/images/home_scred_journey.jpg';

// ---------------------------------------------------------------------------
// Main widget
// ---------------------------------------------------------------------------
class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: _buildAppBar(context),
      drawer: Drawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _HeroBanner(),
            ),
            const SizedBox(height: 28),

            // ── Divine Experiences ────────────────────────────────────────
            _DivineExperiencesSection(),
            const SizedBox(height: 28),

            // ── Recommended for You ───────────────────────────────────────
            _RecommendedHeader(),
            const SizedBox(height: 16),
            _RecommendedScroll(),
            const SizedBox(height: 28),

            // ── Become a Guide ────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _GuideCard(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ── AppBar ──────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF2F4F7),

      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 16,
      title: _LocationPill(),
      actions: [
        // Notification
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: _navy, size: 26),
              onPressed: () {},
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        // Wallet pill
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _navy,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Text(
                '₹1,250',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.account_balance_wallet_rounded,
                    color: Colors.white, size: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Location pill in AppBar title
// ---------------------------------------------------------------------------
class _LocationPill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.location_on_rounded, color: _amberLight, size: 18),
        const SizedBox(width: 4),
        const Text(
          'Varanasi',
          style: TextStyle(
            color: _navy,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 2),
        const Icon(Icons.keyboard_arrow_down_rounded, color: _navy, size: 20),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Hero Banner
// ---------------------------------------------------------------------------
class _HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              kHeroBannerImage,
              fit: BoxFit.cover,
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.72),
                  ],
                ),
              ),
            ),
            // Text content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'THE ETERNAL CITY',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Sacred\nJourneys',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
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
}

// ---------------------------------------------------------------------------
// Section header
// ---------------------------------------------------------------------------
class _SectionHeader extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback? onActionTap;

  const _SectionHeader({
    required this.title,
    required this.action,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          if (action.isNotEmpty)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                action,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _amberLight,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DivineExperiencesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(
          title: 'Divine Experiences',
          action: 'View All',
          onActionTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const _AllDivineExperiencesScreen(),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _DivineExperiencesScrollableRow(
            items: _DivineExperiencesGrid.allItems,
          ),
        ),
      ],
    );
  }
}

class _DivineExperiencesScrollableRow extends StatelessWidget {
  final List<_ExperienceItem> items;

  const _DivineExperiencesScrollableRow({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) {
          return SizedBox(
            width: 170,
            child: _ExperienceCard(item: items[i]),
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Divine Experiences 2x2 image grid
// ---------------------------------------------------------------------------
class _DivineExperiencesGrid extends StatelessWidget {
  static const allItems = [
    _ExperienceItem(
      imageAssetPath: 'assets/images/instant_booking.jpg',
      title: 'Instant\nBooking',
      subtitle: 'Book in seconds',
      subtitleIcon: Icons.flash_on_outlined,
      routeBuilder: _journeyTypeRouteBuilder,
    ),
    _ExperienceItem(
      imageAssetPath: 'assets/images/scheduled_boat.jpg',
      title: 'Scheduled\nBoat',
      subtitle: 'Hourly Departures',
      subtitleIcon: Icons.watch_later_outlined,
      routeBuilder: _scheduledBoatRouteBuilder,
    ),
    _ExperienceItem(
      imageAssetPath: 'assets/images/event_boat.jpg',
      title: 'Event\nBooking',
      subtitle: 'Cultural Festivals',
      subtitleIcon: Icons.festival_outlined,
    ),
    _ExperienceItem(
      imageAssetPath: 'assets/images/evening_arti.jpg',
      title: 'Aarti\nBooking',
      subtitle: 'VIP Ghat Seating',
      subtitleIcon: Icons.star_border_rounded,
    ),
    _ExperienceItem(
      imageAssetPath: 'assets/images/sun_set.jpg',
      title: 'Couple\nFriendly',
      subtitle: 'Private Journeys',
      subtitleIcon: Icons.favorite_border_rounded,
    ),
  ];

  final List<_ExperienceItem> items;

  const _DivineExperiencesGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.92,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => _ExperienceCard(item: items[i]),
    );
  }
}

Route<void> _journeyTypeRouteBuilder(BuildContext context) {
  return MaterialPageRoute(builder: (_) => const JourneyTypeScreen());
}

Route<void> _scheduledBoatRouteBuilder(BuildContext context) {
  return MaterialPageRoute(builder: (_) => const ScheduledBoatScreen());
}

class _ExperienceItem {
  final String imageAssetPath;
  final String title;
  final String subtitle;
  final IconData subtitleIcon;
  final Route<void> Function(BuildContext context)? routeBuilder;

  const _ExperienceItem({
    required this.imageAssetPath,
    required this.title,
    required this.subtitle,
    required this.subtitleIcon,
    this.routeBuilder,
  });
}

class _ExperienceCard extends StatelessWidget {
  final _ExperienceItem item;

  const _ExperienceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.routeBuilder == null
          ? null
          : () => Navigator.push(context, item.routeBuilder!(context)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Photo
            Image.asset(
              item.imageAssetPath,
              fit: BoxFit.cover,
            ),
            // Dark overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.78),
                  ],
                ),
              ),
            ),
            // Text
            Positioned(
              left: 12,
              right: 12,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(item.subtitleIcon, color: _amberLight, size: 13),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          item.subtitle,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AllDivineExperiencesScreen extends StatelessWidget {
  const _AllDivineExperiencesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F4F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'All Divine Experiences',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: _DivineExperiencesGrid(items: _DivineExperiencesGrid.allItems),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Recommended for You header with arrow buttons
// ---------------------------------------------------------------------------
class _RecommendedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recommended for You',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Row(
            children: [
              _ArrowButton(icon: Icons.chevron_left_rounded),
              const SizedBox(width: 8),
              _ArrowButton(icon: Icons.chevron_right_rounded),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;

  const _ArrowButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, size: 20, color: Colors.black87),
    );
  }
}

// ---------------------------------------------------------------------------
// Recommended horizontal scroll
// ---------------------------------------------------------------------------
class _RecommendedScroll extends StatelessWidget {
  static const _cards = [
    _RecommendedItem(
      imageAssetPath: 'assets/images/dasasume_ghat.jpg',
      title: 'Sunrise Ghat Odyssey',
      subtitle: 'Dashashwamedh Ghat departure',
      price: '₹850',
      rating: '4.9',
    ),
    _RecommendedItem(
      imageAssetPath: 'assets/images/evening_ghat.jpg',
      title: 'Ancient Ghats Tour',
      subtitle: 'Guided heritage experience',
      price: '₹450',
      rating: '4.7',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _cards.length,
        itemBuilder: (_, i) => Padding(
          padding: EdgeInsets.only(right: i < _cards.length - 1 ? 16 : 0),
          child: _RecommendedCard(item: _cards[i]),
        ),
      ),
    );
  }
}

class _RecommendedItem {
  final String imageAssetPath;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  const _RecommendedItem({
    required this.imageAssetPath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });
}

class _RecommendedCard extends StatelessWidget {
  final _RecommendedItem item;

  const _RecommendedCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(24)),
                child: Image.asset(
                  item.imageAssetPath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Rating badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1), blurRadius: 4)
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: _amberLight, size: 13),
                      const SizedBox(width: 3),
                      Text(
                        item.rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Details
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STARTS FROM',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 10,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _navy,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Become a Local Guide card
// ---------------------------------------------------------------------------
class _GuideCard extends StatelessWidget {
  static const _avatarAssetPaths = [
    'assets/images/login_cover.jpg',
    'assets/images/login_covers.jpg',
    'assets/images/mankarnika_ghat_2nd.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B2A4A), Color(0xFFE69A0B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Become a Local\nGuide',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Share the sacred stories of Varanasi with travelers from across the world and earn while you guide.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.82),
              fontSize: 13,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // CTA button
          GestureDetector(
            onTap: () {},
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Start Journey',
                style: TextStyle(
                  color: _navy,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Avatar stack + count
          Row(
            children: [
              SizedBox(
                width: 90,
                height: 36,
                child: Stack(
                  children: List.generate(
                    _avatarAssetPaths.length,
                        (i) => Positioned(
                      left: i * 26.0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: const Color(0xFF1B2A4A), width: 2),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            _avatarAssetPaths[i],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: _amberLight,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1B2A4A), width: 2),
                ),
                child: const Center(
                  child: Text(
                    '+12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}