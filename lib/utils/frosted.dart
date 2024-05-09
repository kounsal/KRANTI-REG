import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class FrostedContainer extends StatelessWidget {
  final double blurSigma;
  final double opacity;
  final Widget child;

  const FrostedContainer({
    Key? key,
    required this.child,
    this.blurSigma = 5,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background with blur effect
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                color: Colors.grey.shade200.withOpacity(0.1),
              ),
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}
