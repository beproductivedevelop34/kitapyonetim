import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kitapyonetim/kitap.dart';
import 'package:kitapyonetim/verilenKitapinceleme.dart';

import 'kitapinceleme.dart';

class KitapVerilenler extends StatefulWidget {
  const KitapVerilenler({super.key});

  @override
  State<KitapVerilenler> createState() => _KitapVerilenlerState();
}

class _KitapVerilenlerState extends State<KitapVerilenler> {
  var box = Hive.box<VerilenKitap>("verilenKitap");
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Verilen Kitaplar"),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: ((context, indx) {
                var item = box.getAt(indx) as VerilenKitap;
                return GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) => VerilenKitapInceleme(item.name,item.yazar, item.urunno))));
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            "${item.name}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${item.yazar}",
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          SizedBox(width: 10),
                          ElevatedButton(
                              onPressed: (() async {
                                setState(() {
                                  box.deleteAt(indx);
                                });
                              }),
                              child: Icon(Icons.delete)),
                          
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
      ),
    );
  }
}
