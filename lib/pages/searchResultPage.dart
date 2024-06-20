import 'package:culinear/pages/Resto_List.dart';
import 'package:flutter/material.dart';

class Searchresultpage extends StatefulWidget {
  final String searchInput;

  const Searchresultpage({required this.searchInput});

  @override
  State<Searchresultpage> createState() => _searchResult();
}

class _searchResult extends State<Searchresultpage> {
  late String inputString;
  @override
  void initState() {
    super.initState();
    inputString = widget.searchInput;
  }

  void setSearchInput(String value) {
    setState(() {
      inputString = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    IconData arrow_back_sharp = IconData(0xe793, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _navbar_searchBar(context, arrow_back_sharp),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _searchBar(context, setSearchInput, inputString),
                  SizedBox(height: 20),
                  _listSection('List Kampus', ['$inputString University', '$inputString Biversity']),
                  SizedBox(height: 10),
                  _listSection('List Resto', ['$inputString Bakery', '$inputString Seafood']),
                  SizedBox(height: 20),
                  _productSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _navbar_searchBar(BuildContext context, IconData arrow_back_sharp) {
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
                    elevation: 0),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Row(
                  children: [
                    Icon(arrow_back_sharp, color: Colors.white, size: 31),
                    SizedBox(width: 10),
                    Text('Kembali', style: TextStyle(color: Colors.white, fontSize: 21)),
                  ],
                ),
              ),
              Text(
                '$inputString',
                style: TextStyle(fontSize: 21, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
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

  Widget _listSection(String title, List<String> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: GestureDetector(
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestoList(StringInput: inputString)));
                    },
                    child: Text(
                      'See More',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _productSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produk lainnya',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _productCard('$inputString Face', 'assets/images/Culinear.png'),
            _productCard('Grilled $inputString', 'assets/images/Culinear.png'),
            _productCard('$inputString Charcoal', 'assets/images/Culinear.png'),
            _productCard('Mr. Krabbed', 'assets/images/Culinear.png'),
          ],
        ),
      ],
    );
  }

  Widget _productCard(String name, String imagePath) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 100,
          height: 100,
        ),
        SizedBox(height: 5),
        Text(name),
      ],
    );
  }
}
