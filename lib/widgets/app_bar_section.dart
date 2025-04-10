import 'package:flutter/material.dart';
import '../constants/theme.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
    required this.name,
    required this.sections,
    required this.currentPage,
    required this.onPageSelected,
  });

  final String name;
  final List<String> sections;
  final int currentPage;
  final Function(int) onPageSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppTheme.textColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              sections.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  onTap: () => onPageSelected(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          currentPage == index
                              ? AppTheme.primaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      sections[index],
                      style: TextStyle(
                        fontWeight:
                            currentPage == index
                                ? FontWeight.w600
                                : FontWeight.normal,
                        color:
                            currentPage == index
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
}
