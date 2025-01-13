import 'package:flutter/material.dart';
import 'package:flutter_loginsystems_1/Circle.dart';
import 'package:flutter_loginsystems_1/Cylinder.dart';
import 'package:flutter_loginsystems_1/Rectangle.dart';
import 'package:flutter_loginsystems_1/userinfo.dart';

void main() {
  runApp(MyMenuPages());
}

class MyMenuPages extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyMenuPages> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Menu',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      themeMode: _themeMode,
      home: HomeScreen(
        onThemeChanged: (bool isDarkMode) {
          setState(() {
            _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
          });
        },
      ),
    );
  }
}

Widget _buildCard({required Widget child}) {
  return Card(
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: child,
    ),
  );
}

Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

Widget _buildCalculateButton(
    {required String label, required VoidCallback onPressed}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    child: Text(
      label,
      style: TextStyle(fontSize: 18),
    ),
  );
}

Widget _buildResultText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
  );
}

Widget _buildDescriptionText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
    ),
  );
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;

  HomeScreen({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Calculation'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
            ),
            onPressed: () {
              onThemeChanged(!isDarkMode);
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search calculations...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return MenuCard(menuItem: menuItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final MenuItem menuItem;

  MenuCard({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => menuItem.route),
        );
      },
      child: Card(
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(menuItem.icon, size: 60, color: Colors.grey[800]),
              SizedBox(height: 20),
              Text(
                menuItem.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Widget route;

  MenuItem({required this.title, required this.icon, required this.route});
}

List<MenuItem> menuItems = [
  MenuItem(
    title: 'Circle Area',
    icon: Icons.circle_outlined,
    route: CircleCalculatorScreen(),
  ),
  MenuItem(
    title: 'Rectangle Area',
    icon: Icons.square_outlined,
    route: RectangleCalculatorScreen(),
  ),
  MenuItem(
    title: 'Cub Area',
    icon: Icons.square_rounded,
    route: CubeVolumeScreen(),
  ),
];
