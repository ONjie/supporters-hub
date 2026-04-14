import 'package:flutter/material.dart';

class Testimonial extends StatelessWidget {
  final String quote;
  final String author;
  const Testimonial({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "“$quote”",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        Text("- $author", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
      ],
    );
  }
}