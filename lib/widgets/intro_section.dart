import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/theme.dart';
import '../models/models.dart';
import '../utils/helpers.dart';
import 'animated_button.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({
    super.key,
    required this.personalInfo,
    required this.onContactPressed,
  });

  final PersonalInfo personalInfo;
  final VoidCallback onContactPressed;

  @override
  Widget build(BuildContext context) {
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
                      onPressed: onContactPressed,
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
}
