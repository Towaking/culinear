import 'package:flutter/material.dart';

class BakeryMenu extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"name": "Binus Face", "price": 123999, "image": "assets/binus_face.png"},
    {"name": "Binus Charcoal", "price": 14999, "image": "assets/binus_charcoal.png"},
    {"name": "Kue Ijo", "price": 13999, "image": "assets/kue_ijo.png"},
    {"name": "Diabetes", "price": 214999, "image": "assets/diabetes.png"},
    {"name": "Sponge Cake", "price": 323999, "image": "assets/sponge_cake.png"},
    {"name": "Aurora Cake", "price": 189999, "image": "assets/aurora_cake.png"},
    {"name": "Kebab Tacos", "price": 89999, "image": "assets/kebab_tacos.png"},
    {"name": "Lulus Kuliah", "price": 550000, "image": "assets/lulus_kuliah.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binus Bakery'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildHeader(),
          SizedBox(height: 16),
          _buildMenu(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/binus_bakery_map.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rp 13.999 - Rp 550.000',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 4),
                Text(
                  '4.5/5',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {
                    // Navigate to reviews page
                  },
                  child: Text(
                    'See Review',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          '10:00 - 23:59 WIB\n1.2 km from here',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildMenu() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuItem(item);
      },
    );
  }

  Widget _buildMenuItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item['image']),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${item['price'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
