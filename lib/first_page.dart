import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String url = 'http://ip/CleanGoa/getData.php';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<List> getData() async {
    final responce = await http.get(url);
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111328),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, ss) {
          if (ss.hasError) {
            print(ss.error);
          }
          if (ss.hasData) {
            return Docs(
              list: ss.data,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Docs extends StatelessWidget {
  Docs({this.list});
  final List list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
        //  color: Colors.black54,
          child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
             // elevation: 6.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Image.network(list[i]['photo']),
                      height: 200.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(list[i]['description'],style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat' 
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          
                          height: 20.0,
                          child: Icon(Icons.favorite_border,color: Colors.redAccent,),
                        ),
                      ],
                    )
                  ],
                ),
                
              )
              ),
         // margin: EdgeInsets.all(5.0),
        );
      },
    );
  }
}
