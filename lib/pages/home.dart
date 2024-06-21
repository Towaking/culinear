import 'package:culinear/pages/profile.dart';
import 'package:culinear/pages/searchResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
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
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var _searchInput;

  void _setsearchInput(val){
    setState(() {
      _searchInput = val;
    });
  }

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
                      _searchBar(context),
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
                        itemCount: HomeScreen.foodItems.length,
                        itemBuilder: (context, index) {
                          return FoodItem(
                            image: HomeScreen.foodItems[index]['image']!,
                            label: HomeScreen.foodItems[index]['label']!,
                          );
                        },
                      ),
                      SizedBox(height: 16),
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

  Container _searchBar(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2),
              child: TextField(
                onChanged: (value) {
                  _setsearchInput(value);
                },
                onSubmitted: (value){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Searchresultpage(searchInput: _searchInput,)));
                },
                decoration: InputDecoration(
                  hintText: 'Search Here',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.filter_list),
          ),
        ],
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
                padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                backgroundColor: Colors.transparent,
                elevation: 0
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Row(
                children: [
                  Image.asset('assets/images/Culinear.png', width: 130),
                ],
              )
            ),
            GestureDetector(
              onTap: () {  
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
              },
                child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset('assets/images/fendy.png'),
                ),
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
