import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  final String name;

  const PropertyCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AspectRatio(
          aspectRatio: 1.3,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.hotel, size: constraints.maxWidth * 0.15),

                  const SizedBox(height: 12),

                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const Spacer(),

                  Text(
                    "Rooms: 120",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "Status: Active",
                    style: Theme.of(context).textTheme.bodyMedium,
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
