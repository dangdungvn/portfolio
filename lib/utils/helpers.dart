import 'package:flutter/material.dart';

/// Chuyển đổi tên icon từ chuỗi thành biểu tượng tương ứng cho mạng xã hội
IconData getSocialIcon(String iconName) {
  switch (iconName.toLowerCase()) {
    // case 'linkedin':
    //   return Icons.linkedin;
    case 'github':
      return Icons.code;
    case 'twitter':
      return Icons.flutter_dash;
    case 'facebook':
      return Icons.facebook;
    case 'instagram':
      return Icons.photo_camera;
    case 'youtube':
      return Icons.play_arrow;
    default:
      return Icons.link;
  }
}

/// Chuyển đổi tên icon từ chuỗi thành biểu tượng tương ứng cho kỹ năng
IconData getIconForSkill(String iconName) {
  switch (iconName.toLowerCase()) {
    case 'code':
      return Icons.code;
    case 'design':
      return Icons.design_services;
    case 'web':
      return Icons.web;
    case 'mobile':
      return Icons.phone_android;
    case 'database':
      return Icons.storage;
    case 'server':
      return Icons.dns;
    case 'cloud':
      return Icons.cloud;
    case 'language':
      return Icons.language;
    default:
      return Icons.star;
  }
}
