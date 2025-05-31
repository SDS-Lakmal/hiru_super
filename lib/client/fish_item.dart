import 'package:flutter/material.dart';

class FishApp extends StatelessWidget {
  const FishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish Shop',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const FishHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FishHomePage extends StatefulWidget {
  const FishHomePage({super.key});

  @override
  State<FishHomePage> createState() => _FishHomePageState();
}

class _FishHomePageState extends State<FishHomePage> {
  final List<String> cartItems = [];
  int _selectedIndex = 0;

  void _addToCart(String itemName) {
    setState(() {
      cartItems.add(itemName);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName cart එකට එකතු විය!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFishItem(String name, String price, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              '100g : Rs.$price/=',
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _addToCart(name),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/fish_banner.jpg'),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildFishItem(
                        "Thalapath",
                        "350",
                        "assets/images/thalapath.jpg",
                      ),
                      _buildFishItem(
                        "Balaya",
                        "150",
                        "assets/images/balaya.jpg",
                      ),
                      _buildFishItem(
                        "Prawns",
                        "450",
                        "assets/images/prawns.jpg",
                      ),
                      _buildFishItem(
                        "Cuttlefish",
                        "250",
                        "assets/images/cuttlefish.jpg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      case 1:
        return ListView(
          children:
              cartItems.map((item) => ListTile(title: Text(item))).toList(),
        );
      case 2:
        return const Center(child: Text("Settings Page"));
      case 3:
        return const Center(child: Text("Notifications Page"));
      default:
        return const Center(child: Text("Unknown Page"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
        ],
      ),
    );
  }
}
