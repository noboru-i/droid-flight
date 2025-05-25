import 'package:flutter/material.dart';

class BetaTag extends StatelessWidget {
  final String label;
  const BetaTag({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
