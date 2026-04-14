import 'package:flutter/material.dart';

class StatsTicker extends StatelessWidget {
  const StatsTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Wrap(
        spacing: 50,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        children: [
          _buildStat("4,500+", "Supporters Ready", Colors.green),
          _buildStat("122", "Rallies Won", Colors.blue),
          _buildStat("1500", "Vuvuzelas in Stock", Colors.red),
          _buildStat("98%", "Crowd Loudness", Colors.amber),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Courier',
          ),
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}