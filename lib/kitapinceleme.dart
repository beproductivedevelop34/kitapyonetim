import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Inceleme extends StatefulWidget {
  String name;
  int urunno;
  String yazar;
  DateTime time;
  Inceleme(this.name,this.urunno,this.yazar,this.time);

  @override
  State<Inceleme> createState() => _IncelemeState();
}

class _IncelemeState extends State<Inceleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: 
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "${widget.name}",
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Text(
                "Yazar :${widget.yazar}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10),
              Text(
                "Urun no :${widget.urunno}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10),
              Text(
                "Verilme Tarihi : ${widget.time}",
                style: TextStyle(fontSize: 20),
              )

            ],
          ),
        ),
    );
  }
  }
