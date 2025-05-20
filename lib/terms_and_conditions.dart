import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("1. General Terms"),
            bulletPoint(
              "Customers must follow all store policies and staff instructions while shopping.",
            ),
            bulletPoint(
              "We reserve the right to refuse service to anyone violating our policies or engaging in disruptive behavior.",
            ),
            bulletPoint(
              " Prices, offers, and promotions are subject to change without prior notice.",
            ),
            SizedBox(height: 16),

            sectionTitle("2. Product Purchases"),
            bulletPoint("All purchases are subject to product availability."),
            bulletPoint(
              "We reserve the right to limit quantities per customer.",
            ),
            bulletPoint(
              "Expired or damaged products should be reported immediately for exchange or refund.",
            ),

            SizedBox(height: 16),
            sectionTitle("3. Pricing and Payment"),
            bulletPoint(
              "All prices are in Sri Lankan Rupees and include applicable taxes.",
            ),
            bulletPoint("We accept cash, credit/debit cards"),
            bulletPoint(
              "In case of pricing errors, we reserve the right to correct the price before completing the sale.",
            ),

            SizedBox(height: 16),
            sectionTitle("4. Returns and Refunds"),
            bulletPoint(
              "Customers may return products within 3 days with a valid receipt.",
            ),
            bulletPoint(
              "Perishable goods, opened packages, and items marked 'non-returnable' are not eligible for return.",
            ),
            bulletPoint(
              "Refunds will be issued via the original payment method.",
            ),

            SizedBox(height: 16),
            sectionTitle("5. Online Orders and Delivery"),
            bulletPoint(
              "Online orders must be paid for at checkout or upon delivery.",
            ),
            bulletPoint(
              "Delivery times may vary, and we are not responsible for delays caused by unforeseen circumstances.",
            ),
            bulletPoint("Customers must provide accurate shipping details."),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
