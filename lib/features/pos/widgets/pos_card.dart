import 'package:flutter/material.dart';

class PosCard extends StatelessWidget {
  final String title;

  const PosCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(constraints.maxWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.receipt_long, size: constraints.maxWidth * 0.15),

                  SizedBox(height: constraints.maxHeight * 0.08),

                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const Spacer(),

                  Text(
                    "Amount: ₱1,500",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "Status: Paid",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
