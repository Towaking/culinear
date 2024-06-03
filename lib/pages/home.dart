import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  static const List<Map<String, String>> foodItems = [
    {'image': '🍗', 'label': 'Chicken'},
    {'image': '🍼', 'label': 'Beverages'},
    {'image': '🍙', 'label': 'Rice Ball'},
    {'image': '🍜', 'label': 'Noodles'},
    {'image': '🍌', 'label': 'Fruit'},
    {'image': '🍞', 'label': 'Bread'},
    {'image': '🍝', 'label': 'Spaghetti'},
    {'image': '🍰', 'label': 'Cake'},
  ];

  @override
  Widget build(BuildContext context) {
    const IconData arrow_back_sharp = IconData(0xe793, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            _navbar_Login(context, arrow_back_sharp),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        color: Colors.grey[200],
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Search here"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Icon(Icons.filter_list),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Rekomen Resto',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Card(
                        child: Column(
                          children: [
                            Image.asset('assets/images/BINUS_bakery.png'),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BINUS Bakery',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      Text('Jakarta'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('4.5/5'),
                                      Icon(Icons.star, color: Colors.amber),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Promo',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            promoCard(),
                            promoCard(),
                            promoCard(),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Kategori makanan',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                        ),
                        itemCount: foodItems.length,
                        itemBuilder: (context, index) {
                          return FoodItem(
                            image: foodItems[index]['image']!,
                            label: foodItems[index]['label']!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget promoCard() {
    return Card(
      child: Image.asset(
        "assets/images/promo_makanan.png",
      ),
    );
  }
}

Container _navbar_Login(BuildContext context, IconData arrow_back_sharp) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.12,
    color: Color.fromARGB(255, 244, 67, 54),
    child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                backgroundColor: Colors.transparent,
                elevation: 0
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Row(
                // children: [
                //   Icon(arrow_back_sharp, color: Colors.white, size: 31),
                //   SizedBox(width: 10),
                //   Text('Kembali', style: TextStyle(color: Colors.white, fontSize: 21)),
                // ],
                children: [
                  Image.asset('assets/images/Culinear.png', width: 130),
                ],
              )
            ),
            Container(
              child: SvgPicture.asset('assets/images/profile_fendy.svg', width: 40),
            )
          ],
        ),
      ),
    ),
  );
}

class FoodItem extends StatelessWidget {
  final String image;
  final String label;

  const FoodItem({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            image,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
