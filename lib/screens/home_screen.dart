import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_app/widgets/animated_button.dart';
import '../constants/theme.dart';
import '../models/data.dart';
import '../models/models.dart';
import '../widgets/animated_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _sections = [
    'Giới thiệu',
    'Kinh nghiệm',
    'Kỹ năng',
    'Dự án',
    'Liên hệ',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: kPageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    _buildIntroSection(),
                    _buildExperienceSection(),
                    _buildSkillsSection(),
                    _buildProjectsSection(),
                    _buildContactSection(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.backgroundColor,
            AppTheme.backgroundColor.withOpacity(0.8),
            AppTheme.primaryColor.withOpacity(0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            personalInfo.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppTheme.textColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              _sections.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () => _goToPage(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          _currentPage == index
                              ? AppTheme.primaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _sections[index],
                      style: TextStyle(
                        fontWeight:
                            _currentPage == index
                                ? FontWeight.w600
                                : FontWeight.normal,
                        color:
                            _currentPage == index
                                ? Colors.white
                                : AppTheme.lightTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                      'Xin chào! Tôi là',
                      style: TextStyle(
                        color: AppTheme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 300.ms)
                    .slideX(begin: -30, end: 0),
                const SizedBox(height: 12),
                Text(
                      personalInfo.name,
                      style: TextStyle(
                        color: AppTheme.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                        height: 1.2,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 600.ms, delay: 600.ms)
                    .slideX(begin: -30, end: 0),
                const SizedBox(height: 12),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      personalInfo.title,
                      textStyle: TextStyle(
                        color: AppTheme.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      speed: const Duration(milliseconds: 60),
                    ),
                  ],
                  totalRepeatCount: 1,
                ),
                const SizedBox(height: 24),
                Text(
                      personalInfo.bio,
                      style: TextStyle(
                        color: AppTheme.lightTextColor,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    )
                    .animate(delay: 1200.ms)
                    .fadeIn(duration: 800.ms)
                    .slideY(begin: 30, end: 0),
                const SizedBox(height: 40),
                Row(
                  children: [
                    AnimatedButton(
                      text: 'Xem CV',
                      onPressed: () {
                        // Thêm chức năng tải CV ở đây
                      },
                      icon: Icons.download,
                    ),
                    const SizedBox(width: 20),
                    AnimatedButton(
                      text: 'Liên hệ',
                      onPressed: () => _goToPage(4),
                      backgroundColor: AppTheme.secondaryColor,
                    ),
                  ],
                ).animate(delay: 1500.ms).fadeIn(duration: 800.ms),
                const SizedBox(height: 40),
                Row(
                  children:
                      personalInfo.socialLinks
                          .map(
                            (social) => Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child:
                                  IconButton(
                                    onPressed: () async {
                                      final url = Uri.parse(social.url);
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    },
                                    icon: Icon(
                                      getSocialIcon(social.icon),
                                      size: 24,
                                      color: AppTheme.textColor,
                                    ),
                                  ).animate(delay: 1800.ms).fadeIn(),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryColor.withOpacity(0.1),
              image:
                  personalInfo.avatar.isEmpty
                      ? null
                      : DecorationImage(
                        image: AssetImage(personalInfo.avatar),
                        fit: BoxFit.cover,
                      ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child:
                personalInfo.avatar.isEmpty
                    ? Icon(
                      Icons.person,
                      size: 120,
                      color: AppTheme.primaryColor.withOpacity(0.7),
                    )
                    : null,
          ).animate().fadeIn(duration: 800.ms),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kinh nghiệm làm việc',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -20, end: 0),
          const SizedBox(height: 8),
          Text(
            'Quá trình công tác và học vấn của tôi',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightTextColor),
          ).animate(delay: 200.ms).fadeIn().slideY(begin: -20, end: 0),
          const SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final exp = experiences[index];
              return AnimatedCard(
                index: index,
                padding: const EdgeInsets.all(24),
                // margin: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppTheme.pastelYellow,
                        borderRadius: BorderRadius.circular(12),
                        image:
                            exp.logo.isEmpty
                                ? null
                                : DecorationImage(
                                  image: AssetImage(exp.logo),
                                  fit: BoxFit.contain,
                                ),
                      ),
                      child:
                          exp.logo.isEmpty
                              ? Icon(
                                Icons.business,
                                size: 30,
                                color: AppTheme.textColor,
                              )
                              : null,
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                exp.position,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: AppTheme.textColor,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  exp.duration,
                                  style: TextStyle(
                                    color: AppTheme.accentColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            exp.company,
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            exp.description,
                            style: TextStyle(
                              color: AppTheme.lightTextColor,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...exp.achievements.map(
                            (achievement) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.check_circle,
                                    color: AppTheme.primaryColor,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      achievement,
                                      style: TextStyle(
                                        color: AppTheme.textColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Học vấn',
            style: Theme.of(context).textTheme.titleLarge,
          ).animate().fadeIn(),
          const SizedBox(height: 24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: educations.length,
            itemBuilder: (context, index) {
              final edu = educations[index];
              return AnimatedCard(
                index: index + experiences.length,
                padding: const EdgeInsets.all(24),
                // margin: const EdgeInsets.only(bottom: 24),
                backgroundColor: AppTheme.pastelGreen.withOpacity(0.2),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        image:
                            edu.logo.isEmpty
                                ? null
                                : DecorationImage(
                                  image: AssetImage(edu.logo),
                                  fit: BoxFit.contain,
                                ),
                      ),
                      child:
                          edu.logo.isEmpty
                              ? Icon(
                                Icons.school,
                                size: 30,
                                color: AppTheme.textColor,
                              )
                              : null,
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          edu.degree,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppTheme.textColor,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              edu.institution,
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                edu.duration,
                                style: TextStyle(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    final Map<String, List<Skill>> skillsByCategory = {};

    // Nhóm kỹ năng theo danh mục
    for (var skill in skills) {
      if (!skillsByCategory.containsKey(skill.category)) {
        skillsByCategory[skill.category] = [];
      }
      skillsByCategory[skill.category]!.add(skill);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kỹ năng',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -20, end: 0),
          const SizedBox(height: 8),
          Text(
            'Các công nghệ và kỹ năng mà tôi đã làm việc',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightTextColor),
          ).animate(delay: 200.ms).fadeIn().slideY(begin: -20, end: 0),
          const SizedBox(height: 40),
          ...skillsByCategory.entries.map((entry) {
            final category = entry.key;
            final categorySkills = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.secondaryColor,
                  ),
                ).animate(delay: 400.ms).fadeIn(),
                const SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: categorySkills.length,
                  itemBuilder: (context, index) {
                    final skill = categorySkills[index];
                    return AnimatedCard(
                      index: index,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.accentColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              getIconForSkill(skill.icon),
                              color: AppTheme.accentColor,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  skill.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppTheme.textColor,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: skill.proficiency,
                                  backgroundColor: AppTheme.accentColor
                                      .withOpacity(0.2),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppTheme.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProjectsSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dự án',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -20, end: 0),
          const SizedBox(height: 8),
          Text(
            'Một số dự án tiêu biểu mà tôi đã thực hiện',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightTextColor),
          ).animate(delay: 200.ms).fadeIn().slideY(begin: -20, end: 0),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return AnimatedCard(
                index: index,
                onTap: () async {
                  final url = Uri.parse(project.link);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              index % 2 == 0
                                  ? 'packages/flutter_animate/assets/logo.png'
                                  : 'packages/flutter_animate/assets/logo_white.png',
                            ),
                            fit: BoxFit.contain,
                            opacity: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            [
                              Icons.attach_money,
                              Icons.restaurant,
                              Icons.language,
                              Icons.task_alt,
                            ][index],
                            size: 50,
                            color: AppTheme.accentColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      project.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: AppTheme.textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppTheme.lightTextColor,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          project.technologies
                              .map(
                                (tech) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.highlightColor.withOpacity(
                                      0.3,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    tech,
                                    style: TextStyle(
                                      color: AppTheme.textColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Liên hệ',
            style: Theme.of(context).textTheme.displayMedium,
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -20, end: 0),
          const SizedBox(height: 8),
          Text(
            'Hãy kết nối với tôi qua các kênh liên lạc',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.lightTextColor),
          ).animate(delay: 200.ms).fadeIn().slideY(begin: -20, end: 0),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AnimatedCard(
                  index: 0,
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thông tin liên hệ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildContactItem(
                        Icons.email,
                        'Email',
                        personalInfo.email,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        Icons.phone,
                        'Điện thoại',
                        personalInfo.phone,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        Icons.location_on,
                        'Địa điểm',
                        personalInfo.location,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Kết nối với tôi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children:
                            personalInfo.socialLinks
                                .map(
                                  (social) => Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: IconButton(
                                      onPressed: () async {
                                        final url = Uri.parse(social.url);
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        }
                                      },
                                      icon: Icon(
                                        getSocialIcon(social.icon),
                                        size: 24,
                                        color: AppTheme.primaryColor,
                                      ),
                                      style: IconButton.styleFrom(
                                        backgroundColor: AppTheme.primaryColor
                                            .withOpacity(0.1),
                                        padding: const EdgeInsets.all(12),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: AnimatedCard(
                  index: 1,
                  padding: const EdgeInsets.all(24),
                  backgroundColor: AppTheme.pastelPurple.withOpacity(0.2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gửi tin nhắn',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(decoration: _inputDecoration('Họ tên')),
                      const SizedBox(height: 16),
                      TextFormField(decoration: _inputDecoration('Email')),
                      const SizedBox(height: 16),
                      TextFormField(decoration: _inputDecoration('Tiêu đề')),
                      const SizedBox(height: 16),
                      TextFormField(
                        maxLines: 5,
                        decoration: _inputDecoration('Nội dung tin nhắn'),
                      ),
                      const SizedBox(height: 24),
                      AnimatedButton(
                        text: 'Gửi tin nhắn',
                        onPressed: () {
                          // Thêm chức năng gửi tin nhắn ở đây
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Đã gửi tin nhắn thành công!'),
                              backgroundColor: AppTheme.primaryColor,
                            ),
                          );
                        },
                        icon: Icons.send,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.secondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppTheme.secondaryColor, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: AppTheme.lightTextColor, fontSize: 14),
            ),
            Text(
              value,
              style: TextStyle(
                color: AppTheme.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: AppTheme.lightTextColor),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppTheme.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
    );
  }
}
