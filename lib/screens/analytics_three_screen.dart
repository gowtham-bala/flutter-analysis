import 'package:flutter/material.dart';

class AnalyticsThreeScreen extends StatelessWidget {
  const AnalyticsThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Top performing stock sectors data mapping
    final List<Map<String, dynamic>> performers = [
      {
        "asset": "Equities",
        "sector": "Health store",
        "perf": "+1.82%",
        "val": "\$7,883.20",
      },
      {
        "asset": "Bonds",
        "sector": "Equities",
        "perf": "+1.93%",
        "val": "\$538.50M",
      },
      {
        "asset": "Real Estate",
        "sector": "Equities",
        "perf": "+1.03%",
        "val": "\$533.70",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F11),
        elevation: 0,
        title: const Text(
          "Top Performers Matrix",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏢 Top Performers Leaderboard
            const Text(
              "Asset Performance Leaderboard",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: performers.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.white10, height: 24),
                itemBuilder: (context, index) {
                  final data = performers[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['asset'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data['sector'],
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            data['val'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data['perf'],
                            style: const TextStyle(
                              color: Color(0xFF10B981),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // ⚡ Key Volatility Stats Cards
            const Text(
              "Key Volatility Stats",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatPill(
                  context,
                  "Alpha Index",
                  "1.24",
                  const Color(0xFF1A5CFF),
                ),
                const SizedBox(width: 16),
                _buildStatPill(
                  context,
                  "Beta Volatility",
                  "0.89",
                  const Color(0xFF10B981),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Completion Flow Summary card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.2),
                    Colors.blue.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.purple.withOpacity(0.3)),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.purple,
                    size: 40,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "All 6 Screens Complete!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your dark theme ecosystem is running flawlessly.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatPill(
    BuildContext context,
    String title,
    String measure,
    Color highlight,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  measure,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 8,
                  height: 24,
                  decoration: BoxDecoration(
                    color: highlight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
