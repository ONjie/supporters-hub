import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({super.key,  required this.icon,  required this.text});
 final IconData icon; 
 final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}