import 'package:culinear/pages/resto_detail.dart';
import 'package:flutter/material.dart';


class RestoList extends StatefulWidget {
  final String StringInput;
  const RestoList({required this.StringInput});
  @override
  State<RestoList> createState() => _RestoListState();
}

class _RestoListState extends State<RestoList> {
  late String StringInput;
  late List<Map<String, dynamic>> restaurants;
  void initState() {
    super.initState();
    StringInput = widget.StringInput;
    restaurants =  [
    {
      'name': '$StringInput Bakery',
      'rating': 4.5,
      'hours': '10:00 - 23:59 WIB',
      'priceRange': 'Rp 13.999 - Rp 590.000',
      'distance': '1.2 km',
      'location': 'near $StringInput University'
    },
    {
      'name': '$StringInput Seafood',
      'rating': 4.9,
      'hours': '11:00 - 11:59 WIB',
      'priceRange': 'Rp 39.000 - Rp 125.000',
      'distance': '1.5 km',
      'location': 'near $StringInput University'
    },
    {
      'name': 'Warteg $StringInput',
      'rating': 4.6,
      'hours': '07:00 - 21:59 WIB',
      'priceRange': 'Rp 5.000 - Rp 30.000',
      'distance': '2 km',
      'location': 'near $StringInput University'
    },
  ];

  }

  Widget _restaurantItem(Map<String, dynamic> restaurant) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: Colors.black, width: 1.0),  // Border
      boxShadow: [
        BoxShadow(
          color: Colors.white24,
          blurRadius: 4.0,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: ListTile(
      title: Text(restaurant['name']),
      subtitle: Text('${restaurant['rating']} ⭐'),
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => resto_Detail(inputString: StringInput, restaurantName: restaurant['name'])));
        },
        child: Text(
          'See More',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Resto',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
            child: TextField(
              decoration: InputDecoration(labelText: '$StringInput'),
              onChanged: (value) {
                setState(() {
                  StringInput = value;
                  // Update the restaurant names with the new input
                  restaurants[0]['name'] = '$StringInput Bakery';
                  restaurants[1]['name'] = '$StringInput Seafood';
                  restaurants[2]['name'] = 'Warteg $StringInput';
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _restaurantItem(restaurants[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}



  Widget _restaurantItem(Map<String, dynamic> restaurant) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant['name'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(restaurant['hours']),
                Text('${restaurant['rating']}/5',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Text(restaurant['priceRange']),
            SizedBox(height: 8),
            Text('${restaurant['distance']} ${restaurant['location']}'),
          ],
        ),
      ),
    );
  }

