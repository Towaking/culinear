import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool? _check = true;
  void _onClickCheckedChange(bool value) => setState((){
      _check = !value;
  });

  @override
  Widget build(BuildContext context) {
    const IconData arrow_back_sharp = IconData(0xe793, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _navbar_Register(context, arrow_back_sharp),
              SizedBox(height: 100,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masukan Nama',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,                            
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Masukan Password',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _check,
                          onChanged: (val){
                            setState(() {
                              _check = val;
                            });
                          },
                          visualDensity: VisualDensity.comfortable,
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              'Saya setuju dengan semua persyaratan yang berlaku di aplikasi ini.',
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height:120),
                    _lanjut_btn(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _lanjut_btn(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Color.fromARGB(255, 255, 191, 0)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
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

  Container _navbar_Register(BuildContext context, IconData arrow_back_sharp) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              color: Color.fromARGB(255, 244, 67, 54),
              child: Padding(
                padding: const EdgeInsets.only(right:20),
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
                          Icon(arrow_back_sharp,color: Colors.black,size: 31,),
                          SizedBox(width: 10,),
                          Text('Kembali',style: TextStyle(color: Colors.black,fontSize: 21),),
                        ],
                      )
                    ),
                    Text(
                      'NAVBAR',
                      style: TextStyle(
                        fontSize: 21
                      ),
                      )
                  ],
                ),
              ),
            );
  }
}