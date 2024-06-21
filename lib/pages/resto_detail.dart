import 'package:culinear/pages/review_pages.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class resto_Detail extends StatefulWidget {
  final String inputString, restaurantName;
  const resto_Detail({required this.inputString, required this.restaurantName});

  @override
  State<resto_Detail> createState() => _RestoDetailState();
}

class _RestoDetailState extends State<resto_Detail> {
  late String stringInput, restaurantName;
  late List<Map<String, dynamic>> menuItems;
  double? latitude;
  double? longitude;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    stringInput = widget.inputString;
    restaurantName = widget.restaurantName;
    menuItems = [
      {"name": "$stringInput Face", "price": 123999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "$stringInput Charcoal", "price": 14999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Kue Ijo", "price": 13999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Diabetes", "price": 214999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Sponge Cake", "price": 323999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Aurora Cake", "price": 189999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Kebab Tacos", "price": 89999, "image": "assets/images/BINUS_bakery.png"},
      {"name": "Lulus $stringInput", "price": 550000, "image": "assets/images/BINUS_bakery.png"},
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
        title: Text('$restaurantName'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
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
        SizedBox(height: 20,),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReviewPage(Resto_name: restaurantName)));
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
