import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 👉 IMPORT custom pages
import 'contact_us.dart';
import 'terms_and_conditions.dart';
import 'about_us.dart';
import 'grocery_page.dart';
import 'cart_page.dart';
//import 'cart_items.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final List<Map<String, String>> categories = [
    {'name': 'Fish', 'image': 'assets/images/fish.jpg'},
    {'name': 'Meat', 'image': 'assets/images/meat.jpg'},
    {'name': 'Vegetables', 'image': 'assets/images/vegetables.jpg'},
    {'name': 'Fruits', 'image': 'assets/images/fruit.jpg'},
    {'name': 'Beverages', 'image': 'assets/images/beverages.jpg'},
    {'name': 'Grocery', 'image': 'assets/images/grocery.jpg'},
  ];

  String searchQuery = '';
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      // Home tab - stay on current page
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const UnderDevelopingPage(title: 'Settings'),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const UnderDevelopingPage(title: 'Notification'),
        ),
      );
    }
  }

  void _navigateToMenuItem(String title) {
    if (title == 'Contact Us') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ContactUsPage()),
      );
    } else if (title == 'Terms & Conditions') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TermsAndConditionsPage()),
      );
    } else if (title == 'About Us') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AboutUsPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => UnderDevelopingPage(title: title)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredCategories =
        categories
            .where(
              (category) => category['name']!.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
            )
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text("Home"),
        centerTitle: true,
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: _navigateToMenuItem,
          itemBuilder:
              (BuildContext context) => const [
                PopupMenuItem(value: 'Settings', child: Text('Settings')),
                PopupMenuItem(value: 'Profile', child: Text('Profile')),
                PopupMenuItem(value: 'Contact Us', child: Text('Contact Us')),
                PopupMenuItem(
                  value: 'Terms & Conditions',
                  child: Text('Terms & Conditions'),
                ),
                PopupMenuItem(value: 'About Us', child: Text('About Us')),
              ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.admin_panel_settings),
            onPressed: () {
              Navigator.pushNamed(context, '/admin');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'What are you looking for?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final category = filteredCategories[index];
                  return GestureDetector(
                    onTap: () {
                      if (category['name'] == 'Grocery') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => GroceryPage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${category['name']} is not available yet.',
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              category['image']!,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['name']!,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('discount')
                      .doc('banner')
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var data = snapshot.data!.data() as Map<String, dynamic>;
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enjoy',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[700],
                        ),
                      ),
                      Text(
                        '${data['percentage']}% OFF',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'for bills above ${data['minimumBill']}/=',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
      ],
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
    );
  }
}

class UnderDevelopingPage extends StatelessWidget {
  final String? title;

  const UnderDevelopingPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Under Development'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'This feature is under development!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
