import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String Resto_name;
  ReviewPage({required this.Resto_name});
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<Map<String, dynamic>> reviews = [
    {"review": "lalapannya enak", "rating": 5},
    {"review": "isi rotinya sedikit", "rating": 3},
    {"review": "Roti nya basi", "rating": 2},
    {"review": "Ada pelayan namanya evan kurang ajar", "rating": 5},
    {"review": "Roti nya gosong", "rating": 1},
    {"review": "Teman saya ignas setelah makan roti ini sakit perut", "rating": 5},
    {"review": "kami meeting di tempat ini besok nya perusahaannya bankrut", "rating": 3},
  ];

  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  void _addReview() {
    if (_reviewController.text.isNotEmpty && _ratingController.text.isNotEmpty) {
      setState(() {
        reviews.add({
          "review": _reviewController.text,
          "rating": int.tryParse(_ratingController.text) ?? 0,
        });
        _reviewController.clear();
        _ratingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binus Bakery'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What others think about this resto",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    child: ListTile(
                      title: Text(review['review']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(review['rating'].toString()),
                          Icon(Icons.star, color: Colors.red),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              "What do you think of this restaurant",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: "Type here...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 50,
                  child: TextField(
                    controller: _ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "5",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addReview,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
