
import 'package:flutter/material.dart';

class SupporterCard extends StatefulWidget {
  final String title;
  final String price;
  final IconData icon;
  final String subtitle;

  const SupporterCard(this.title, this.price, this.icon, this.subtitle, {super.key});

  @override
  State<SupporterCard> createState() => _SupporterCardState();
}

class _SupporterCardState extends State<SupporterCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isHovered ? (Matrix4.identity()..translate(0, -10, 0)) : Matrix4.identity(),
        width: 260,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.black12 : Colors.black.withOpacity(0.05),
              blurRadius: isHovered ? 20 : 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, size: 40, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(
              widget.price,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const Text("/per hour", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}