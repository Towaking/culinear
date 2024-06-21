import 'package:flutter/material.dart';

class ExtendSearch extends StatefulWidget {
  final String Inputsearch;
  ExtendSearch({required this.Inputsearch});
  @override
  State<ExtendSearch> createState() => _ExtendSearchState();
}

class _ExtendSearchState extends State<ExtendSearch> {
  late String Inputsearch;
  static IconData arrow_back_sharp = IconData(0xe793, fontFamily: 'MaterialIcons', matchTextDirection: true);

  @override
  void initState(){
    super.initState();
    Inputsearch = widget.Inputsearch;
  }

  void setsearchInput(String strings){
    setState(() {
      Inputsearch = strings;
    });
  }

  final List<Map<String, String>> items = [
    {
      'title': 'Binus Face',
      'price': 'Rp. 123.999',
      'distance': '1.2 km',
      'image': 'assets/images/cake.png',
      'location': 'Binus Bakery',
    },
    {
      'title': 'Binus Charcoal',
      'price': 'Rp. 14.999',
      'distance': '1.2 km',
      'image': 'assets/images/charcoal.png',
      'location': 'Binus Bakery',
    },
    {
      'title': 'Grilled Patrick',
      'price': 'Rp. 47.000',
      'distance': '3.1 km',
      'image': 'assets/images/patrick.png',
      'location': 'Binus Seafood',
    },
    {
      'title': 'Mr. Krabbed',
      'price': 'Rp. 125.000',
      'distance': '3.1 km',
      'image': 'assets/images/crab.png',
      'location': 'Binus Seafood',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Kembali',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Column(
        children: [
          _searchBar(context, setsearchInput, Inputsearch),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Image.asset(
                          items[index]['image']!,
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                items[index]['title']!,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                items[index]['price']!,
                                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${items[index]["distance"]} - ${items[index]["location"]}',
                                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

  Container _searchBar(BuildContext context, Function setSearchInput, String inputString) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        color: Colors.grey[200],
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                child: TextField(
                  onChanged: (value) {
                    setSearchInput(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search For $inputString',
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
