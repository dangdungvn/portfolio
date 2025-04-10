import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/theme.dart';
import '../models/models.dart';
import '../utils/helpers.dart';
import 'animated_card.dart';
import 'animated_button.dart';
import 'contact_item.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key, required this.personalInfo});

  final PersonalInfo personalInfo;

  @override
  Widget build(BuildContext context) {
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
              Expanded(child: _buildContactInfoCard()),
              const SizedBox(width: 30),
              Expanded(child: _buildContactForm(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoCard() {
    return AnimatedCard(
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
          ContactItem(
            icon: Icons.email,
            title: 'Email',
            value: personalInfo.email,
          ),
          const SizedBox(height: 16),
          ContactItem(
            icon: Icons.phone,
            title: 'Điện thoại',
            value: personalInfo.phone,
          ),
          const SizedBox(height: 16),
          ContactItem(
            icon: Icons.location_on,
            title: 'Địa điểm',
            value: personalInfo.location,
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
                            backgroundColor: AppTheme.primaryColor.withOpacity(
                              0.1,
                            ),
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return AnimatedCard(
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
