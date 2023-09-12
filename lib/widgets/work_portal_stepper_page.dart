import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String serviceName;
  final String companyName;
  final String country;
  final String contact;
  final String email;
  final int cardIndex;
  final Map<String, dynamic> cardData;

  ServiceDetailsScreen({
    required this.serviceName,
    required this.companyName,
    required this.country,
    required this.contact,
    required this.email,
    required this.cardIndex,
    required this.cardData, required Map<String, dynamic> userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service Name: $serviceName'),
            Text('Company Name: $companyName'),
            Text('Country: $country'),
            Text('Contact: $contact'),
            Text('Email: $email'),
            Text('ind: $email'),
            Text('Card Index: $cardIndex'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
