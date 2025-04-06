import 'package:flutter/material.dart';
import '../constants/theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final int index;
  final bool enableHover;

  const AnimatedCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.index = 0,
    this.enableHover = true,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(
          duration: kCardAnimationDuration,
          delay: Duration(milliseconds: 100 * index),
        ),
        SlideEffect(
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
          duration: kCardAnimationDuration,
          delay: Duration(milliseconds: 100 * index),
          curve: Curves.easeOutQuart,
        ),
      ],
      child: _buildCard(),
    );
  }

  Widget _buildCard() {
    return enableHover
        ? _HoverCard(
          backgroundColor: backgroundColor,
          padding: padding,
          width: width,
          height: height,
          onTap: onTap,
          child: child,
        )
        : Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppTheme.cardColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            boxShadow: AppTheme.cardShadow,
          ),
          child: child,
        );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  const _HoverCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppTheme.cardColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadius),
            boxShadow:
                _isHovering
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ]
                    : AppTheme.cardShadow,
            border:
                _isHovering
                    ? Border.all(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      width: 1.5,
                    )
                    : null,
          ),
          transform:
              _isHovering
                  ? (Matrix4.identity()..translate(0, -5))
                  : Matrix4.identity(),
          child: widget.child,
        ),
      ),
    );
  }
}
