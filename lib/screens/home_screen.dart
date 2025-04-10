import 'package:flutter/material.dart';
import '../constants/theme.dart';
import '../models/data.dart';
import '../widgets/app_bar_section.dart';
import '../widgets/background_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/intro_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

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
          // Phần nền
          const BackgroundSection(),

          // Nội dung chính
          Column(
            children: [
              // App Bar
              AppBarSection(
                name: personalInfo.name,
                sections: _sections,
                currentPage: _currentPage,
                onPageSelected: _goToPage,
              ),

              // Nội dung các trang
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // Giới thiệu
                    IntroSection(
                      personalInfo: personalInfo,
                      onContactPressed: () => _goToPage(4),
                    ),

                    // Kinh nghiệm
                    ExperienceSection(
                      experiences: experiences,
                      educations: educations,
                    ),

                    // Kỹ năng
                    SkillsSection(skills: skills),

                    // Dự án
                    ProjectsSection(projects: projects),

                    // Liên hệ
                    ContactSection(personalInfo: personalInfo),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
