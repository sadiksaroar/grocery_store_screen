import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryStoreScreen(),
    );
  }
}

class GroceryStoreScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Pearl Milling', 'price': '\$163.00', 'image': 'assets/pearl_milling.png'},
    {'name': 'Double Chocolate', 'price': '\$163.00', 'image': 'assets/double_chocolate.png'},
    {'name': 'Crust Frozen', 'price': '\$134.00', 'image': 'assets/crust_frozen.png'},
    {'name': 'California Pizza', 'price': '\$105.00', 'image': 'assets/california_pizza.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grocery Store',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.verified, color: Colors.blue),
              ],
            ),
            Text('104 Products 1.3k Followers'),
            SizedBox(height: 10),
            Row(
              children: [
                ChoiceChip(label: Text('All'), selected: true, onSelected: (_) {}),
                SizedBox(width: 5),
                ChoiceChip(label: Text('Latest'), selected: false, onSelected: (_) {}),
                SizedBox(width: 5),
                ChoiceChip(label: Text('Most Popular'), selected: false, onSelected: (_) {}),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(products[index]['image']!, fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index]['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text(products[index]['price']!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.favorite_border, color: Colors.red),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
