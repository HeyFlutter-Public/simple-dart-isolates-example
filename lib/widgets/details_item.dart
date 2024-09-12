import 'package:flutter/material.dart';

class DetailsItem extends StatelessWidget {
  const DetailsItem({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: Text(
            '$title:',
            style: TextStyle(color: colors.onSurface.withOpacity(0.6)),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(child: Text(content, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}
