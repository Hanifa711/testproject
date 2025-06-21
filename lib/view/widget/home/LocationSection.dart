import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  final String address;
  const LocationSection({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.location_on, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Location"),
              Text(address, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward),
      ],
    );
  }
}
