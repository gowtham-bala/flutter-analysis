import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample premium mock transaction records matching the UI look
    final List<Map<String, dynamic>> transactions = [
      {
        "date": "9/12/2023",
        "desc": "Doiose ssale",
        "type": "SMF",
        "amount": "+\$220.00",
        "status": "Verified",
        "isSuccess": true,
      },
      {
        "date": "9/12/2023",
        "desc": "Compity mports...",
        "type": "Amount",
        "amount": "-\$20.00",
        "status": "Stacked",
        "isSuccess": false,
      },
      {
        "date": "9/12/2023",
        "desc": "Driver lex mpo...",
        "type": "SMK",
        "amount": "+\$30.00",
        "status": "Verified",
        "isSuccess": true,
      },
      {
        "date": "8/12/2023",
        "desc": "Global Tech Corp",
        "type": "Wire",
        "amount": "+\$1,450.00",
        "status": "Verified",
        "isSuccess": true,
      },
      {
        "date": "7/12/2023",
        "desc": "Cloud Server Subscription",
        "type": "SaaS",
        "amount": "-\$89.00",
        "status": "Verified",
        "isSuccess": true,
      },
      {
        "date": "5/12/2023",
        "desc": "Atm Withdrawal Error",
        "type": "Cash",
        "amount": "-\$200.00",
        "status": "Failed",
        "isSuccess": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F11),
        elevation: 0,
        title: const Text(
          "Transaction History",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Premium Slate Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search transactions...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 24),

            // Table Header Labels
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description / Date",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Amount / Status",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white10, height: 24),

            // Dynamic Transaction List View
            Expanded(
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.white, height: 1),
                itemBuilder: (context, index) {
                  final item = transactions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Side: Title and Sub-details
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: item['isSuccess']
                                    ? const Color(
                                        0xFF10B981,
                                      ).withValues(alpha: 0.1)
                                    : Colors.red.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                item['isSuccess']
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: item['isSuccess']
                                    ? const Color(0xFF10B981)
                                    : Colors.red,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['desc'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${item['date']} • ${item['type']}",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Right Side: Amount Value and Verification Pill Badge
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item['amount'],
                              style: TextStyle(
                                color: item['amount'].startsWith('+')
                                    ? const Color(0xFF10B981)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: item['isSuccess']
                                    ? const Color(
                                        0xFF10B981,
                                      ).withValues(alpha: 0.15)
                                    : Colors.red.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                item['status'],
                                style: TextStyle(
                                  color: item['isSuccess']
                                      ? const Color(0xFF10B981)
                                      : Colors.red,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
