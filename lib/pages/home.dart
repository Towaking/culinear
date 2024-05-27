import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const IconData arrow_back_sharp = IconData(0xe793, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            
            _navbar_Login(context, arrow_back_sharp),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Container(
                    height: 40,
                    color: Colors.grey[200],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rekomen Resto',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        // Image.asset('assets/images/uniga_bakery.jpg'), // Replace with the path to your restaurant image
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'UNIGA Bakery',
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget promoCard() {
    return Card(
      child: SvgPicture.asset(
        'assets/images/promo_makanan.svg', // Replace with the path to your promo image
        width: 120,
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
                padding: const EdgeInsets.only(right:20),
                child: Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                          backgroundColor: Colors.transparent,
                          elevation: 0
                        ),
                        onPressed: (){
                          Navigator.pop(context,true);
                        },
                        child: Row(
                          children: [
                            Icon(arrow_back_sharp,color: Colors.white,size: 31,),
                            SizedBox(width: 10,),
                            Text('Kembali',style: TextStyle(color: Colors.white,fontSize: 21),),
                          ],
                        )
                      ),
                      Container(
                        child: //insert profile_fendy.svg image here
                        SvgPicture.asset('assets/images/profile_fendy.svg', width: 40),
                      )
                    ],
                  ),
                ),
              ),
            );
  }
