import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerilenKitapInceleme extends StatefulWidget {
  String name;
  String yazar;
  int urunno;
  VerilenKitapInceleme(this.name, this.yazar, this.urunno);

  @override
  State<VerilenKitapInceleme> createState() => _VerilenKitapIncelemeState();
}

class _VerilenKitapIncelemeState extends State<VerilenKitapInceleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "${widget.name}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
