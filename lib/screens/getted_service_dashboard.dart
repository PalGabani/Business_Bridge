import 'package:business_bridge/screens/homepage.dart';
import 'package:flutter/material.dart';

class ServiceDetailPage extends StatelessWidget {
  final String serviceName;
  final String executivename;
  final String contact; final String email;
  final String country;


  ServiceDetailPage({required this.serviceName, required this.executivename,required this.contact,required this.email,required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: ListView.builder(
        itemCount: 1, // You have one item for the service details
        itemBuilder: (context, index) {
          return Card(
            elevation: 4, // Adjust elevation as needed
            margin: EdgeInsets.all(16), // Adjust margin as needed
            child: Padding(
              padding: EdgeInsets.all(16), // Adjust padding as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Service Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    serviceName,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10), // Adjust spacing as needed
                  Text(
                    'Executive Name:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    executivename,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10), // Adjust spacing as needed
                  Text(
                    'Contact:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    contact,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10), // Adjust spacing as needed
                  Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10), // Adjust spacing as needed
                  Text(
                    'Country:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    country,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Price And Other Discussion Provide will be soon!",
                    style: TextStyle(fontSize: 16),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate back to the home page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => homepage(),
                          ),
                        );
                      },
                      child: Text('Go to Home'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}