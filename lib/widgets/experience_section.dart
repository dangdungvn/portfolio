import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/theme.dart';
import '../models/models.dart';
import 'animated_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({
    super.key,
    required this.experiences,
    required this.educations,
  });

  final List<Experience> experiences;
  final List<Education> educations;

  @override
  Widget build(BuildContext context) {
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
          _buildExperienceList(context),
          const SizedBox(height: 40),
          Text(
            'Học vấn',
            style: Theme.of(context).textTheme.titleLarge,
          ).animate().fadeIn(),
          const SizedBox(height: 24),
          _buildEducationList(),
        ],
      ),
    );
  }

  Widget _buildExperienceList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return AnimatedCard(
          index: index,
          padding: const EdgeInsets.all(24),
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
    );
  }

  Widget _buildEducationList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: educations.length,
      itemBuilder: (context, index) {
        final edu = educations[index];
        return AnimatedCard(
          index: index + experiences.length,
          padding: const EdgeInsets.all(24),
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
    );
  }
}
