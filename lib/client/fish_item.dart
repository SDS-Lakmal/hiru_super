import 'package:flutter/material.dart';

void main() {
  runApp(FishApp());
}

class FishApp extends StatelessWidget {
  const FishApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish Shop',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: FishHomePage(),
    );
  }
}

class FishHomePage extends StatefulWidget {
  const FishHomePage({super.key});

  @override
  _FishHomePageState createState() => _FishHomePageState();
}

class _FishHomePageState extends State<FishHomePage> {
  List<String> cartItems = [];

  void addToCart(String itemName) {
    setState(() {
      cartItems.add(itemName);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName cart එකට එකතු විය!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget buildFishItem(String name, String price, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 50, // ✅ Larger image height
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 1),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 1),
            Text(
              '100g : Rs.$price/=',
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => addToCart(name),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/fish_banner.jpg'),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    buildFishItem(
                      "Thalapath",
                      "350",
                      "assets/images/thalapath.jpg",
                    ),
                    buildFishItem("Balaya", "150", "assets/images/balaya.jpg"),
                    buildFishItem("Prawns", "450", "assets/images/prawns.jpg"),
                    buildFishItem(
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
    } else if (_selectedIndex == 1) {
      return ListView(
        children: cartItems.map((item) => ListTile(title: Text(item))).toList(),
      );
    } else if (_selectedIndex == 2) {
      return Center(child: Text("Settings Page"));
    } else {
      return Center(child: Text("Notifications Page"));
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
