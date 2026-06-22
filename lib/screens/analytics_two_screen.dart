import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'analytics_three_screen.dart'; // We will create this next for Screen 6

class AnalyticsTwoScreen extends StatelessWidget {
  const AnalyticsTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F11),
        elevation: 0,
        title: const Text(
          "Performance Trends",
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
            // 📊 1. Net Cash Flow Bar Chart Card
            const Text(
              "Net Cash Flow",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  barGroups: [
                    _makeBarGroup(0, 12, 8),
                    _makeBarGroup(1, 16, 10),
                    _makeBarGroup(2, 9, 14),
                    _makeBarGroup(3, 18, 6),
                    _makeBarGroup(4, 14, 12),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 📈 2. Detailed Performance Analysis Line Chart Card
            const Text(
              "Detailed Performance Analysis",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 240,
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: true,
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineBarsData: [
                    // Equities (Blue line)
                    _makeLineSpec(const Color(0xFF1A5CFF), [
                      const FlSpot(0, 1),
                      const FlSpot(2, 3.5),
                      const FlSpot(4, 2.8),
                      const FlSpot(6, 5),
                    ]),
                    // Bonds (Green line)
                    _makeLineSpec(const Color(0xFF10B981), [
                      const FlSpot(0, 2),
                      const FlSpot(2, 2.5),
                      const FlSpot(4, 4.1),
                      const FlSpot(6, 4.5),
                    ]),
                    // Real Estate (Purple line)
                    _makeLineSpec(Colors.purple, [
                      const FlSpot(0, 0.5),
                      const FlSpot(2, 1.8),
                      const FlSpot(4, 2.2),
                      const FlSpot(6, 3.9),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Navigation Button to reach Screen 6
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnalyticsThreeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View Market Performers",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper helper to generate stacked bars
  BarChartGroupData _makeBarGroup(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: const Color(0xFF1A5CFF),
          width: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        BarChartRodData(
          toY: y2,
          color: const Color(0xFF10B981),
          width: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  // Helper helper to generate smooth performance lines
  LineChartBarData _makeLineSpec(Color color, List<FlSpot> spots) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
