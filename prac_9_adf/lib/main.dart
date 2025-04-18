import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Destination {
  final String name;
  final String country;
  final Color color;
  final IconData icon;

  Destination({
    required this.name,
    required this.country,
    required this.color,
    required this.icon,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: TravelGridScreen(),
    );
  }
}

class TravelGridScreen extends StatelessWidget {
  final List<Destination> destinations = [
    Destination(name: 'Santorini', country: 'Greece', color: Colors.blue.shade300, icon: Icons.beach_access),
    Destination(name: 'Kyoto', country: 'Japan', color: Colors.red.shade300, icon: Icons.temple_buddhist),
    Destination(name: 'Paris', country: 'France', color: Colors.purple.shade300, icon: Icons.location_city),
    Destination(name: 'New York', country: 'USA', color: Colors.amber.shade300, icon: Icons.apartment),
    Destination(name: 'Bali', country: 'Indonesia', color: Colors.green.shade300, icon: Icons.waves),
    Destination(name: 'Dubai', country: 'UAE', color: Colors.orange.shade300, icon: Icons.sunny),
    Destination(name: 'Rome', country: 'Italy', color: Colors.cyan.shade300, icon: Icons.history_edu),
    Destination(name: 'Cape Town', country: 'South Africa', color: Colors.lime.shade300, icon: Icons.landscape),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Explore Destinations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = (constraints.maxWidth ~/ 160).clamp(2, 4);
            return GridView.builder(
              itemCount: destinations.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final destination = destinations[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          destination.color,
                          destination.color.withOpacity(0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          destination.icon,
                          size: 50,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16),
                        Text(
                          destination.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Text(
                          destination.country,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}