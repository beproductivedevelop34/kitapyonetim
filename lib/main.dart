import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kitapyonetim/kitap.dart';
import 'package:kitapyonetim/kitapinceleme.dart';
import 'package:kitapyonetim/verilenkitap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlinanKitapAdapter());
  Hive.registerAdapter(VerilenKitapAdapter());
  await Hive.openBox<AlinanKitap>("alinanKitap");
  await Hive.openBox<VerilenKitap>("verilenKitap");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<void> kontrol() async {
  var box = Hive.box<AlinanKitap>("alinanKitap");
  var box2 = Hive.box<VerilenKitap>("verilenKitap");
  if (box != null) {
    for (var i = 0; box.length > i; i++) {
      var item = box.get(i);
      if (item!.time == DateTime.now()) {
        var kitap = VerilenKitap(item.urunno, item.name, item.yazar);
        box2.add(kitap);
        box.delete(i);
      }
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    kontrol();
    super.initState();
  }

  var te1 = TextEditingController();
  var te2 = TextEditingController();
  var te3 = TextEditingController();
  var box = Hive.box<AlinanKitap>("alinanKitap");
  var selectedDate = DateTime.now();
  var box2 = Hive.box<VerilenKitap>("verilenKitap");
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
           DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue
          ),
            child: Align(
              alignment: Alignment.center,
              child: Text("Menu",style: TextStyle(color : Colors.white,fontWeight: FontWeight.bold,fontSize: 20)))
              ),
            ListTile(title : Text("Verilen Kitap"),onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => KitapVerilenler())));
            },)
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: ((context, indx) {
                var item = box.getAt(indx);
                return GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => Inceleme(item.name,
                                item.urunno, item.yazar, item.time))));
                  }),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Text(
                            "${item!.name}",
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
                          ElevatedButton(
                              onPressed: (() async {
                                setState(() {
                                  var kitap = VerilenKitap(
                                      item.urunno, item.name, item.yazar);
                                  box2.add(kitap);
                                  box.deleteAt(indx);
                                });
                              }),
                              child: Text("Verildi"))
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                actions: [
                  TextField(
                    controller: te1,
                    decoration: InputDecoration(hintText: "Kitap No"),
                  ),
                  TextField(
                    controller: te2,
                    decoration: InputDecoration(hintText: "Kitap Ad"),
                  ),
                  TextField(
                    controller: te3,
                    decoration: InputDecoration(hintText: "Yazar"),
                  ),
                  TextField(
                    onTap: (() {
                      setState(() {
                        showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        ).then((value) {
                          setState(() {
                            selectedDate = value!;
                          });
                        });
                      });
                    }),
                    decoration: InputDecoration(hintText: "Verilme Tarihi"),
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        var kitap = AlinanKitap(
                          int.parse(te1.text),
                          te2.text,
                          te3.text,
                          selectedDate,
                          DateTime.now(),
                        );
                        box.add(kitap);
                      }),
                      child: Text("Ekle"))
                ],
              );
            }));
      })),
    );
  }
}
