import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_planner/app/theme.dart';
import 'package:trip_planner/features/home/domain/plan/plan.dart';
import 'package:trip_planner/shared/layout/section.dart';
import 'package:trip_planner/shared/widgets/container.dart';

class CExpansionPanel extends StatefulWidget {
  const CExpansionPanel({
    Key? key,
    required this.title,
    required this.pretitle,
    required this.bannerTitle,
    required this.bannerValue,
    required this.body,
  }) : super(key: key);

  final String title;
  final String pretitle;
  final String bannerTitle;
  final String bannerValue;
  final Widget body;

  @override
  CExpansionPanelState createState() => CExpansionPanelState();
}

class CExpansionPanelState extends State<CExpansionPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(
      begin: -pi / 2,
      end: 0,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
              if (_isExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: CContainer(
            child: Section(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.pretitle,
                            style: subtitleStyle,
                          ),
                          Text(
                            widget.title,
                            style: titleStyle,
                          ),
                        ],
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _animation.value,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: !_isExpanded
                      ? Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(245, 245, 245, 0.08),
                            borderRadius: borderRadius16,
                          ),
                          padding: padding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.bannerTitle,
                                style: subtitleStyle,
                              ),
                              Text(
                                widget.bannerValue,
                                style: titleStyle,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8.h),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: _isExpanded ? widget.body : const SizedBox.shrink(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
