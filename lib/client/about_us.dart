import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        centerTitle: true,
        title: Text(
          "About Us",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Our supermarket service plays a crucial role in ensuring a smooth and convenient shopping experience for customers. Efficient checkout counters, well-stocked shelves, and friendly staff contribute to customer satisfaction. Good service includes quick billing, clear product labeling, and organized aisles that make it easy to find items. Additionally, supermarkets that offer online shopping and home delivery provide added convenience. Cleanliness and hygiene, especially in fresh produce and meat sections, are essential for maintaining quality standards. Customer service desks help resolve complaints and inquiries efficiently. Loyalty programs, discounts, and promotional offers enhance the shopping experience, encouraging repeat visits. A well-managed supermarket focuses on speed, accuracy, and customer engagement, ensuring that shoppers leave satisfied. Ultimately, excellent service builds trust and fosters long-term customer relationships, making the supermarket a preferred choice for daily needs.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
