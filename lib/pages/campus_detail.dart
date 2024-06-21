import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class CampusDetail extends StatefulWidget {
  final String inputString;
  const CampusDetail({required this.inputString});

  @override
  State<CampusDetail> createState() => _CampusDetailState();
}

class _CampusDetailState extends State<CampusDetail> {
  late String stringInput;
  late List<Map<String, dynamic>> nearbyRestaurants;
  double? latitude;
  double? longitude;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    stringInput = widget.inputString;
    nearbyRestaurants = [
      {
        'name': '$stringInput Bakery',
        'priceRange': 'Rp 13.999 - Rp 590.000',
        'hours': '10:00 - 23:59 WIB',
        'distance': '1.2 km from here',
        'rating': 4.5,
        'image': 'assets/images/BINUS_bakery.png'
      },
      {
        'name': '$stringInput Seafood',
        'priceRange': 'Rp 39.000 - Rp 125.000',
        'hours': '11:00 - 11:59 WIB',
        'distance': '1.5 km from here',
        'rating': 4.9,
        'image': 'assets/images/BINUS_bakery.png'
      },
      {
        'name': 'Warteg $stringInput',
        'priceRange': 'Rp 5.000 - Rp 30.000',
        'hours': '07:00 - 21:59 WIB',
        'distance': '2 km from here',
        'rating': 4.6,
        'image': 'assets/images/BINUS_bakery.png'
      },
    ];

    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    if (stringInput.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(stringInput);
        if (locations.isNotEmpty) {
          final location = locations.first;
          setState(() {
            latitude = location.latitude;
            longitude = location.longitude;
            isLoading = false;
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Place not found')));
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$stringInput University'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16),
              children: [
                _buildHeader(),
                SizedBox(height: 16),
                Text(
                  'List Restaurant',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                _buildNearbyRestaurants(),
              ],
            ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        latitude != null && longitude != null
            ? Container(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude!, longitude!),
                    zoom: 14.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('selected-location'),
                      position: LatLng(latitude!, longitude!),
                    ),
                  },
                ),
              )
            : Container(
                child: Image.asset("assets/images/BINUS_bakery.png"),
              ),
        SizedBox(height: 20),
        Text(
          'Rp 13.999 - Rp 550.000',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReviewPage(
                          restaurantName: '$stringInput Bakery',
                        )));
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
        SizedBox(height: 4),
        Text(
          '10:00 - 23:59 WIB\n1.2 km from here',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildNearbyRestaurants() {
    return Column(
      children: nearbyRestaurants.map((restaurant) {
        return _buildRestaurantItem(restaurant);
      }).toList(),
    );
  }

  Widget _buildRestaurantItem(Map<String, dynamic> restaurant) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            restaurant['image'],
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant['name'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant['priceRange'],
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant['hours'],
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant['distance'],
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(
                      '${restaurant['rating']}/5',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  final String restaurantName;

  const ReviewPage({required this.restaurantName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews for $restaurantName'),
      ),
      body: Center(
        child: Text('Reviews Page'),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CampusDetail(inputString: 'Binus'),
    ));
