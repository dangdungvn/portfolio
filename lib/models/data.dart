import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'models.dart';

// Dữ liệu mẫu cho portfolio
final PersonalInfo personalInfo = PersonalInfo(
  name: 'Nguyễn Văn A',
  title: 'Mobile Developer | Flutter Specialist',
  bio:
      'Là một nhà phát triển Flutter nhiệt huyết với hơn 3 năm kinh nghiệm, tôi đam mê tạo ra các ứng dụng di động đẹp mắt và hiệu quả. Tôi luôn tìm kiếm cơ hội để học hỏi và áp dụng các công nghệ mới để nâng cao kỹ năng lập trình của mình.',
  email: 'nguyenvana@example.com',
  phone: '(+84) 9xx xxx xxx',
  location: 'Hà Nội, Việt Nam',
  avatar: '', // Để trống để sử dụng icon mặc định
  socialLinks: [
    SocialLink(name: 'GitHub', url: 'https://github.com/', icon: 'github'),
    SocialLink(
      name: 'LinkedIn',
      url: 'https://linkedin.com/',
      icon: 'linkedin',
    ),
    SocialLink(name: 'Twitter', url: 'https://twitter.com/', icon: 'twitter'),
  ],
);

final List<Experience> experiences = [
  Experience(
    company: 'Công ty ABC Tech',
    position: 'Senior Flutter Developer',
    duration: '01/2023 - Hiện tại',
    description:
        'Phát triển và duy trì các ứng dụng di động đa nền tảng sử dụng Flutter.',
    logo: '', // Để trống để sử dụng icon mặc định
    achievements: [
      'Dẫn dắt nhóm 5 developer phát triển ứng dụng thương mại điện tử với hơn 100,000 lượt tải xuống',
      'Tối ưu hiệu suất ứng dụng giảm 40% thời gian tải',
      'Áp dụng kiến trúc Clean Architecture và BLoC để xây dựng codebase có khả năng mở rộng',
    ],
  ),
  Experience(
    company: 'Startup XYZ',
    position: 'Flutter Developer',
    duration: '03/2021 - 12/2022',
    description: 'Tham gia phát triển ứng dụng fintech cho người dùng cá nhân.',
    logo: '', // Để trống để sử dụng icon mặc định
    achievements: [
      'Xây dựng hệ thống thanh toán trực tuyến an toàn với Firebase và Stripe',
      'Phát triển các tính năng biểu đồ trực quan và thống kê tài chính',
      'Triển khai CI/CD pipeline, cải thiện chất lượng code bằng unit testing và UI testing',
    ],
  ),
  Experience(
    company: 'Đại học Công nghệ',
    position: 'Trợ giảng',
    duration: '09/2020 - 02/2021',
    description: 'Hỗ trợ giảng dạy các môn học về phát triển di động.',
    logo: '', // Để trống để sử dụng icon mặc định
    achievements: [
      'Hướng dẫn sinh viên phát triển ứng dụng di động đơn giản bằng Flutter',
      'Đánh giá các dự án của sinh viên và cung cấp phản hồi cải thiện',
    ],
  ),
];

final List<Education> educations = [
  Education(
    institution: 'Đại học Bách Khoa Hà Nội',
    degree: 'Kỹ sư Công nghệ Thông tin',
    duration: '2016 - 2020',
    logo: '', // Để trống để sử dụng icon mặc định
  ),
  Education(
    institution: 'Udacity',
    degree: 'Flutter Developer Nanodegree',
    duration: '2020',
    logo: '', // Để trống để sử dụng icon mặc định
  ),
];

final List<Skill> skills = [
  Skill(
    name: 'Flutter',
    proficiency: 0.95,
    icon: 'flutter',
    category: 'Phát triển di động',
  ),
  Skill(
    name: 'Dart',
    proficiency: 0.90,
    icon: 'dart',
    category: 'Ngôn ngữ lập trình',
  ),
  Skill(
    name: 'Firebase',
    proficiency: 0.85,
    icon: 'firebase',
    category: 'Backend',
  ),
  Skill(
    name: 'React Native',
    proficiency: 0.70,
    icon: 'react',
    category: 'Phát triển di động',
  ),
  Skill(name: 'Git', proficiency: 0.80, icon: 'git', category: 'Công cụ'),
  Skill(
    name: 'UI/UX Design',
    proficiency: 0.75,
    icon: 'design',
    category: 'Thiết kế',
  ),
  Skill(name: 'REST API', proficiency: 0.85, icon: 'api', category: 'Backend'),
  Skill(
    name: 'GraphQL',
    proficiency: 0.65,
    icon: 'graphql',
    category: 'Backend',
  ),
];

final List<Project> projects = [
  Project(
    title: 'Ứng dụng quản lý tài chính cá nhân',
    description:
        'Ứng dụng giúp người dùng theo dõi chi tiêu, thiết lập ngân sách và phân tích xu hướng tài chính.',
    technologies: ['Flutter', 'Firebase', 'Charts', 'Hive'],
    thumbnail: 'assets/images/project1.png',
    link: 'https://github.com/example/finance-app',
  ),
  Project(
    title: 'Ứng dụng đặt đồ ăn',
    description:
        'Ứng dụng cho phép người dùng dễ dàng tìm kiếm, đặt đồ ăn từ các nhà hàng gần đó và theo dõi đơn hàng theo thời gian thực.',
    technologies: ['Flutter', 'Google Maps API', 'Firebase', 'Stripe'],
    thumbnail: 'assets/images/project2.png',
    link: 'https://github.com/example/food-delivery',
  ),
  Project(
    title: 'Ứng dụng học ngôn ngữ',
    description:
        'Nền tảng học ngôn ngữ tương tác với trò chơi học từ vựng, luyện phát âm và theo dõi tiến độ.',
    technologies: ['Flutter', 'TensorFlow Lite', 'Firebase ML Kit'],
    thumbnail: 'assets/images/project3.png',
    link: 'https://github.com/example/language-learning',
  ),
  Project(
    title: 'Ứng dụng quản lý công việc',
    description:
        'Ứng dụng todo list nâng cao với các tính năng lập lịch, nhắc nhở và đồng bộ đa thiết bị.',
    technologies: [
      'Flutter',
      'Bloc pattern',
      'Supabase',
      'Local Notifications',
    ],
    thumbnail: 'assets/images/project4.png',
    link: 'https://github.com/example/task-manager',
  ),
];

// Icon mapping cho các biểu tượng kỹ năng
IconData getIconForSkill(String iconName) {
  switch (iconName.toLowerCase()) {
    case 'flutter':
      return Icons.flutter_dash;
    case 'dart':
      return Icons.code;
    case 'firebase':
      return Icons.local_fire_department;
    case 'react':
      return Icons.android;
    case 'git':
      return FontAwesomeIcons.git;
    case 'design':
      return Icons.design_services;
    case 'api':
      return Icons.api;
    case 'graphql':
      return Icons.hub;
    default:
      return Icons.circle;
  }
}

// Icon mapping cho social links
IconData getSocialIcon(String iconName) {
  switch (iconName.toLowerCase()) {
    case 'github':
      return FontAwesomeIcons.github;
    case 'linkedin':
      return FontAwesomeIcons.linkedin;
    case 'twitter':
      return FontAwesomeIcons.twitter;
    case 'facebook':
      return FontAwesomeIcons.facebook;
    case 'instagram':
      return FontAwesomeIcons.instagram;
    default:
      return FontAwesomeIcons.link;
  }
}
