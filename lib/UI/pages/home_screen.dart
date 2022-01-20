import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //ScrollPosition controller  = ScrollPosition(d);

  @override
  Widget build(BuildContext context) {

    void lista2d() {
      int a = 3;
      int b = 3;
      var x = List.generate(10, (i) => List.generate(10, (j) => i + j));
      print(x);
      print(x[0][2]);
    }
    lista2d();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          //color: Colors.grey,
          //height: 900,
          child: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            height: 10,
            child: Text("a"),
          ),
          Container(
            height: 10,
            child: Text("a"),
          ),
          Container(
            height: 10,
            child: Text("a"),
          ),
          Container(height: 10,child: Text("a"),),
          Container(height: 10,child: Text("a"),),Container(height: 10,child: Text("a"),)
        ],
      )),
    );


  }

// GridView.builder(
// padding: EdgeInsets.all(10),
// scrollDirection: Axis.vertical,
// //reverse: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// childAspectRatio: 0.9,
// crossAxisCount: 10, crossAxisSpacing: 1, mainAxisSpacing: 1),
// itemCount: 100,
// itemBuilder: (_, index) {
// index+=1;
//
// //print(index);
// return Container(
//
// color: Colors.grey,
// child: Text('')
// );
// }),

}
