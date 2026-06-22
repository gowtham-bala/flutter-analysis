import 'package:flutter/material.dart';
import 'package:inten_project1/screens/transactions_screen.dart';

Widget _buildActionButton(
  BuildContext context,
  IconData icon,
  String label, {
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    ),
  );
}

Widget buildMoreButton(BuildContext context) {
  return _buildActionButton(
    context,
    Icons.more_horiz,
    "More",
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransactionsScreen()),
      );
    },
  );
}
