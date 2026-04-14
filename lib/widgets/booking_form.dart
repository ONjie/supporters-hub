


import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  String? _selectedPackage;
  String? _selectedRegion;
  int _quantity = 1; // Default quantity
  int _unitPrice = 0;

  final Map<String, int> _packagePrices = {
    "Standard Children": 50,
    "Professional Women": 200,
    "Enthusiastic Men": 300,
    "Elite Youth Squad": 400,
    "Full Mega Rally (Mixed)": 5000,
  };

  int get _totalCost => _unitPrice * _quantity;

  void _updatePackage(String? package) {
    setState(() {
      _selectedPackage = package;
      _unitPrice = _packagePrices[package] ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        children: [
          const Icon(Icons.rocket_launch, size: 40, color: Colors.green),
          const SizedBox(height: 10),
          const Text("Deployment Order", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            "Finalize your crowd logistics",
            style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.normal),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Candidate/Party Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Deployment Region",
                prefixIcon: Icon(Icons.map),
                border: OutlineInputBorder(),
              ),
              items: ["Banjul", "Kanifing", "Serrekunda", "Bundung", "Brikama", "Mansakonko", "Kerewan", "Janjanbureh", "Basse"]
                  .map((region) => DropdownMenuItem(value: region, child: Text(region)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedRegion = val),
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Select Crowd Package",
                prefixIcon: Icon(Icons.groups),
                border: OutlineInputBorder(),
              ),
              items: _packagePrices.keys
                  .map((pkg) => DropdownMenuItem(value: pkg, child: Text(pkg)))
                  .toList(),
              onChanged: _updatePackage,
            ),
            const SizedBox(height: 15),
            
            // 🔢 QUANTITY SELECTOR
            Row(
              children: [
                const Text("Quantity:", style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  "$_quantity",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Deployment Cost:", style: TextStyle(fontSize: 14)),
                  Text(
                    "D$_totalCost",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "*Excludes transportation and food fees",
              style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Abort Mission", style: TextStyle(color: Colors.red)),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green[800],
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          onPressed: _selectedPackage == null
              ? null
              : () {
                  Navigator.pop(context);
                  _showSuccessSnackBar(context);
                },
          child: const Text("DEPLOY NOW 🔥"),
        ),
      ],
    );
  }

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[900],
        content: Text(
          "Deploying $_quantity $_selectedPackage to $_selectedRegion! 😂",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}