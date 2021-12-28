import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("ความรู้เกี่ยวกับคอมพิวเตอร์")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder( builder: (context,  AsyncSnapshot snapshot){
            //var data = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index){

                return MyBox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'], snapshot.data[index]['image_url'],snapshot.data[index]['detail']);
              },
              itemCount: snapshot.data.length,);

        },
        future: getData(),
        //future: DefaultAssetBundle.of(context).loadString('assets/data.json'),

        )
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String image_url,String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = image_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: 185,
      decoration: BoxDecoration(
        //color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken)),

        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(3, 3),
            blurRadius: 3,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          SizedBox(
            height: 18,
          ),
          TextButton(
              onPressed: () {
                print("Next Page >>>");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPage(v1,v2,v3,v4)));
              },
              child: Text("อ่านต่อ"))
        ],
      ),
    );
  }


  Future getData() async {
    //https://raw.githubusercontent.com/supon26862/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com','/supon26862/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    return result;
  }


}
