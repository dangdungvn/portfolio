class PersonalInfo {
  final String name;
  final String title;
  final String bio;
  final String email;
  final String phone;
  final String location;
  final String avatar;
  final List<SocialLink> socialLinks;

  PersonalInfo({
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.phone,
    required this.location,
    required this.avatar,
    required this.socialLinks,
  });
}

class SocialLink {
  final String name;
  final String url;
  final String icon;

  SocialLink({required this.name, required this.url, required this.icon});
}

class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final String logo;
  final List<String> achievements;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required this.logo,
    required this.achievements,
  });
}

class Education {
  final String institution;
  final String degree;
  final String duration;
  final String logo;

  Education({
    required this.institution,
    required this.degree,
    required this.duration,
    required this.logo,
  });
}

class Skill {
  final String name;
  final double proficiency; // 0.0 đến 1.0
  final String icon;
  final String category;

  Skill({
    required this.name,
    required this.proficiency,
    required this.icon,
    required this.category,
  });
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String thumbnail;
  final String link;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.thumbnail,
    required this.link,
  });
}
