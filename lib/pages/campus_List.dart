import 'package:culinear/pages/campus_detail.dart';
import 'package:flutter/material.dart';

class CampusList extends StatefulWidget {
  final String StringInput;
  const CampusList({required this.StringInput});
  @override
  State<CampusList> createState() => _CampusListState();
}

class _CampusListState extends State<CampusList> {
  late String StringInput;
  late List<Map<String, dynamic>> campuses;

  @override
  void initState() {
    super.initState();
    StringInput = widget.StringInput;
    campuses = [
      {
        'name': 'Binus University',
        'restaurants': 3,
        'distance': '0.4 km',
      },
      {
        'name': 'Binus Biversity',
        'restaurants': 6,
        'distance': '0.8 km',
      },
      {
        'name': 'Binus Triversity',
        'restaurants': 12,
        'distance': '1.6 km',
      },
      {
        'name': 'Binus Quadversity',
        'restaurants': 24,
        'distance': '3.2 km',
      },
      {
        'name': 'Binus Quinversity',
        'restaurants': 48,
        'distance': '6.4 km',
      },
    ];
  }

  Widget _campusItem(Map<String, dynamic> campus) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              campus['name'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('${campus['restaurants']} Restaurants around'),
            SizedBox(height: 8),
            Text('${campus['distance']} from here'),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Navigate to the campus details page (if any)
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CampusDetail(inputString: StringInput)));
              },
              child: Text(
                'See More',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Kampus'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Enter Campus Name Prefix'),
              onChanged: (value) {
                setState(() {
                  StringInput = value;
                  // Update the campus names with the new input
                  campuses[0]['name'] = '$StringInput University';
                  campuses[1]['name'] = '$StringInput Biversity';
                  campuses[2]['name'] = '$StringInput Triversity';
                  campuses[3]['name'] = '$StringInput Quadversity';
                  campuses[4]['name'] = '$StringInput Quinversity';
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: campuses.length,
              itemBuilder: (context, index) {
                return _campusItem(campuses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
