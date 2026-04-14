import 'package:flutter/material.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 800),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          const Text(
            "Frequently Asked Questions 🤨",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Everything you need to know before the rally.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          _buildFAQItem(
            "Do the supporters bring their own chairs?",
            "No. For D50, they stand. For an extra D20, we can provide plastic chairs. For D100, they will bring their own 'Ashobi' (uniform) to match your party colors.",
          ),
          _buildFAQItem(
            "What happens if it rains?",
            "Our supporters are waterproof, but their enthusiasm may drop by 20%. We recommend booking our 'Rain Dance' package to make it look like a blessing instead.",
          ),
          _buildFAQItem(
            "Can they chant specific slogans?",
            "Yes! Our 'Enthusiast' and 'Elite' packages include 3 custom slogans. Note: We do not chant slogans longer than 10 words (it gets confusing).",
          ),
          _buildFAQItem(
            "Is food included in the price?",
            "The prices shown are for 'Noise Only'. If you want them to look well-fed and happy, you must provide Benachin or Domoda at the venue.",
          ),
          _buildFAQItem(
            "Do you provide transport?",
            "We have a fleet of trucks ready for deployment. If you book the 'Youth Squad', motorbikes are included automatically.",
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin:  EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ExpansionTile(
        shape: const Border(), // Removes the default divider
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              answer,
              style: TextStyle(color: Colors.grey[800], height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}