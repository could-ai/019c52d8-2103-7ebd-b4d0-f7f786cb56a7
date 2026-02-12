import 'package:flutter/material.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              backgroundColor: Theme.of(context).colorScheme.primary,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  // Navigation logic would go here
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isBookmarked = !_isBookmarked;
                    });
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Placeholder for Course Image
                    Container(
                      color: const Color(0xFF1E293B),
                      child: const Center(
                        child: Icon(
                          Icons.security,
                          size: 80,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'BESTSELLER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Cisers: Advanced Cybersecurity Certification',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              const Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '(1,240 ratings)',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(Icons.people, color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '8.5k Students',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12,
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
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: const [
                    Tab(text: 'Overview'),
                    Tab(text: 'Curriculum'),
                    Tab(text: 'Instructor'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildOverviewTab(),
            _buildCurriculumTab(),
            _buildInstructorTab(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '\$89.99',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '\$199.99',
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Enroll Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'About this course',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'Master the art of cybersecurity with the Cisers Advanced Certification. This comprehensive course covers network security, ethical hacking, risk management, and compliance standards. Designed for both beginners and professionals looking to upskill.',
          style: TextStyle(color: Colors.black87, height: 1.5),
        ),
        const SizedBox(height: 24),
        const Text(
          'What you\'ll learn',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildFeatureItem('Network Security Fundamentals'),
        _buildFeatureItem('Ethical Hacking & Penetration Testing'),
        _buildFeatureItem('Risk Management Frameworks'),
        _buildFeatureItem('Incident Response Strategies'),
        _buildFeatureItem('Cloud Security Architecture'),
        const SizedBox(height: 24),
        const Text(
          'Requirements',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildRequirementItem('Basic understanding of computer networks'),
        _buildRequirementItem('A computer with 8GB RAM minimum'),
        _buildRequirementItem('No prior coding experience required'),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildRequirementItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.fiber_manual_record, color: Colors.grey, size: 12),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildCurriculumTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionTile(
          'Section 1: Introduction to Cybersecurity',
          '4 Lessons • 45m',
          [
            _buildLessonTile('1. Welcome to the Course', '05:00', true),
            _buildLessonTile('2. The Current Threat Landscape', '12:30', true),
            _buildLessonTile('3. Key Security Concepts', '15:45', false),
            _buildLessonTile('4. Setting Up Your Lab', '11:45', false),
          ],
        ),
        const SizedBox(height: 16),
        _buildSectionTile(
          'Section 2: Network Security',
          '5 Lessons • 1h 20m',
          [
            _buildLessonTile('5. OSI Model Deep Dive', '18:00', false),
            _buildLessonTile('6. TCP/IP Protocols', '22:15', false),
            _buildLessonTile('7. Firewalls and IDS/IPS', '15:30', false),
            _buildLessonTile('8. Wireless Security', '14:45', false),
            _buildLessonTile('9. Network Hardening', '09:30', false),
          ],
        ),
        const SizedBox(height: 16),
        _buildSectionTile(
          'Section 3: Ethical Hacking Basics',
          '3 Lessons • 55m',
          [
            _buildLessonTile('10. Reconnaissance Techniques', '20:00', false),
            _buildLessonTile('11. Scanning and Enumeration', '18:30', false),
            _buildLessonTile('12. Vulnerability Assessment', '16:30', false),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTile(String title, String subtitle, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        shape: const Border(), // Removes default border
        children: children,
      ),
    );
  }

  Widget _buildLessonTile(String title, String duration, bool isUnlocked) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isUnlocked ? Colors.blue.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isUnlocked ? Icons.play_arrow : Icons.lock,
          color: isUnlocked ? Colors.blue : Colors.grey,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: isUnlocked ? Colors.black87 : Colors.grey,
        ),
      ),
      trailing: Text(
        duration,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      onTap: isUnlocked ? () {} : null,
    );
  }

  Widget _buildInstructorTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dr. Alex Mercer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Senior Security Architect',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    const Text('4.9 Instructor Rating'),
                    const SizedBox(width: 16),
                    const Icon(Icons.play_circle_outline, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    const Text('12 Courses'),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'About the Instructor',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text(
          'Dr. Alex Mercer is a cybersecurity expert with over 15 years of experience in the field. He has worked with Fortune 500 companies to secure their infrastructure and has trained thousands of students in ethical hacking and network defense. He holds multiple certifications including CISSP, CISM, and CEH.',
          style: TextStyle(color: Colors.black87, height: 1.5),
        ),
        const SizedBox(height: 24),
        const Text(
          'Other Courses by Alex',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildOtherCourseItem('Mastering Python for Security'),
        _buildOtherCourseItem('Cloud Security Essentials'),
      ],
    );
  }

  Widget _buildOtherCourseItem(String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.school, color: Colors.blueGrey),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
