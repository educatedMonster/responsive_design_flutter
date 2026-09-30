import 'package:flutter/material.dart';

import 'widgets/report_card.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ReportCard(title: "Daily Revenue Report"),
        ReportCard(title: "Sales Summary"),
        ReportCard(title: "Occupancy Report"),
      ],
    );
  }
}
