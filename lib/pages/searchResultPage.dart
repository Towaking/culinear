import 'package:flutter/material.dart';

class Searchresultpage extends StatefulWidget {
  final String searchInput;

  const Searchresultpage({required this.searchInput});

  @override
  State< Searchresultpage> createState() => _searchResult();
}

class _searchResult extends State< Searchresultpage> {
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
            _navbar_searchBar(context,arrow_back_sharp),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _searchBar(context,setSearchInput,inputString),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}

  Container _navbar_searchBar(BuildContext context, IconData arrow_back_sharp) {
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
                      Text(
                        'NAVBAR',
                        style: TextStyle(
                          fontSize: 21
                        ),
                        )
                    ],
                  ),
                ),
              ),
            );
  }

 Container _searchBar(BuildContext context,Function setSearchInput, String inputString) {
     return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2),
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