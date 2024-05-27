import 'package:culinear/pages/Login.dart';
import 'package:culinear/pages/register.dart';
import 'package:flutter/material.dart';

class AuthenPages extends StatelessWidget {
  const AuthenPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              _culinear_img(context),
              SizedBox(height: 50),
              _authen_title(context),
              SizedBox(height: 50),
              _gabung_btn(context),
              SizedBox(height: 50),
              _masuk_btn(context),
              ],
            ),
        )
        ),
      );
  }

  Container _masuk_btn(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color.fromARGB(255, 255, 191, 0)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              },
                child: Text(
                  'Masuk',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black
                  ),
                ),
              ),
              
            );
  }

  Container _gabung_btn(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color.fromRGBO(255, 85, 7, 1)
                ),
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));},
                child: Text(
                  'Gabung Dengan Kita ',
                  style: TextStyle(
                    fontSize: 21,
                    color: Color.fromARGB(246, 244, 234, 234)
                  ),
                ),
              ),
            );
  }

  Container _authen_title(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Text(
                  'Siap Berkuliner sekitar?',
                  style: TextStyle(
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                ),
    );
  }

  Container _culinear_img(BuildContext context) {
    return Container(
              height: MediaQuery.of(context).size.height * 0.24,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/authen_1.png"),
                    fit: BoxFit.cover
                  )
                )
              );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: MediaQuery.of(context).size.height * 0.06,
        );
  }
}