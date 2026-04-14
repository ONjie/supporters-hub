/*import 'dart:async';
import 'package:flutter/material.dart';

class InfoBanner extends StatefulWidget {
  const InfoBanner({super.key});

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  // The deadline: May 21st, 2026
  final DateTime _deadline = DateTime(2026, 5, 21);

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    // Update the countdown every second
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _calculateTimeLeft());
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    setState(() {
      _timeLeft = _deadline.difference(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    if (d.isNegative) return "Registration Closed";
    final days = d.inDays;
    final hours = d.inHours % 24;
    final minutes = d.inMinutes % 60;
    final seconds = d.inSeconds % 60;
    return "${days}d ${hours}h ${minutes}m ${seconds}s";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.red[600], // Dark red for that urgent PSA look
      child: Column(
        children: [
          const Text(
            "🗳️ Voter card registration ends 21st May, 2026. Please go and register!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "TIME REMAINING: ${_formatDuration(_timeLeft)}",
            style: const TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier', // Gives it a "digital clock" feel
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class InfoBanner extends StatefulWidget {
  const InfoBanner({super.key});

  @override
  State<InfoBanner> createState() => _InfoBannerState();
}

class _InfoBannerState extends State<InfoBanner> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;
  final DateTime _deadline = DateTime(2026, 5, 21);

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _calculateTimeLeft());
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    setState(() => _timeLeft = _deadline.difference(now));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    if (d.isNegative) return "CLOSED";
    return "${d.inDays}d ${d.inHours % 24}h ${d.inMinutes % 60}m ${d.inSeconds % 60}s";
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.red[900],
      child: Column(
        children: [
          Text(
            "🗳️ Voter registration ends 21st May, 2026. Register now!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 12 : 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "TIME REMAINING: ${_formatDuration(_timeLeft)}",
            style: TextStyle(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courier',
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }
}