import 'package:flutter/material.dart';
import 'package:supporters_hub/widgets/booking_form.dart';
import 'package:supporters_hub/widgets/faq_section.dart';
import 'package:supporters_hub/widgets/info_banner.dart';
import 'package:supporters_hub/widgets/service_item.dart';
import 'package:supporters_hub/widgets/stats_ticker.dart';
import 'package:supporters_hub/widgets/supporter_card.dart';
import 'package:supporters_hub/widgets/testimonial.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  bool isMobile(double width) => width < 600;
  bool isTablet(double width) => width >= 600 && width < 1024;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final mobile = isMobile(width);
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                  fontSize: mobile ? 22 : 35,
                ),
                children: const [
                  TextSpan(text: "Supp", style: TextStyle(color: Colors.red)),
                  TextSpan(text: "orte", style: TextStyle(color: Colors.blue)),
                  TextSpan(text: "rsHub", style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                const InfoBanner(),

                //HERO SECTION
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: mobile ? 50 : 80,
                    horizontal: mobile ? 16 : 20,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1B5E20), Color(0xFF43A047)],
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Hire Campaign Supporters",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mobile ? 28 : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "We bring the noise. You take the credit. 😂",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: mobile ? 16 : 20,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: mobile ? 20 : 32,
                            vertical: mobile ? 14 : 20,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => const BookingForm(),
                          );
                        },
                        icon: const Icon(Icons.bolt),
                        label: const Text("Book Now"),
                      ),
                    ],
                  ),
                ),

                const StatsTicker(),
                const SizedBox(height: 40),

                // PRICING
                Text(
                  "Select Your Crowd Mix",
                  style: TextStyle(
                    fontSize: mobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: const [
                      SupporterCard(
                        "Standard Children",
                        "D50",
                        Icons.child_care,
                        "Includes candy and 1 small flag",
                      ),
                      SupporterCard(
                        "Professional Women",
                        "D200",
                        Icons.woman,
                        "Specialized in rhythmic clapping",
                      ),
                      SupporterCard(
                        "Enthusiastic Men",
                        "D300",
                        Icons.man,
                        "Loud shouting and bouncer vibes",
                      ),
                      SupporterCard(
                        "Elite Youth Squad",
                        "D400",
                        Icons.groups,
                        "Comes with Vuvuzelas and TikTok dances",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // SERVICES
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 450),
                  padding: EdgeInsets.all(mobile ? 20 : 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Why Choose SupportersHub?",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      ServiceItem(
                        icon: Icons.check_circle,
                        text: "Guaranteed 120 decibels of noise.",
                      ),
                      ServiceItem(
                        icon: Icons.check_circle,
                        text:
                            "Sync-Clapping technology (no one misses a beat).",
                      ),
                      ServiceItem(
                        icon: Icons.check_circle,
                        text:
                            "Crying-on-demand for emotional speeches (Premium extra).",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                // TESTIMONIALS
                Container(
                  width: double.infinity,
                  color: Colors.green.withOpacity(0.05),
                  padding: EdgeInsets.symmetric(
                    vertical: 60,
                    horizontal: mobile ? 16 : 20,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Trusted by 'Winners' 😂",
                        style: TextStyle(
                          fontSize: mobile ? 22 : 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "100% Legit. No questions asked. 🤫",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 40),

                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: const [
                          SizedBox(
                            width: 300,
                            child: Testimonial(
                              quote:
                                  "Our rally was empty until we called them. Now we need a bigger stadium!",
                              author: "Honorable Anonymous",
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Testimonial(
                              quote:
                                  "The opposition was shocked when 500 motorbikes appeared out of nowhere. Quality noise! 🔥",
                              author: "Chief Campaign Manager",
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Testimonial(
                              quote:
                                  "The 'Crying Squad' was so convincing, even I started believing my own emotional speech. 😭",
                              author: "Aspiring Candidate",
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Testimonial(
                              quote:
                                  "They learned my name in 5 minutes and chanted it for 6 hours straight. True professionals.",
                              author: "Local Councilor",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // FAQS
                const FAQSection(),
                const SizedBox(height: 20),
                //FOOTER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      const Text(
                        "⚠️ This is a parody website for entertainment purposes only.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Built with ❤️ by Muhammed O Njie",
                        style: TextStyle(
                          color: Colors.grey[600], 
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}