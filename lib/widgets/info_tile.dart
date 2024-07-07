import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Icon(
          icon,
          size: 48,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 24,
            )),
        Text(subtitle,
            style: const TextStyle(
              // fontSize: 24,
            )),
      ]),
    );
  }
}
