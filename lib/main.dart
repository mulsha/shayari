import 'package:flutter/material.dart';
import 'package:shayari/shayari_pages/secoundpage.dart';


void main() {
  runApp(MaterialApp(home: shyari()));
}

class shyari extends StatefulWidget {
  const shyari({Key? key}) : super(key: key);

  @override
  State<shyari> createState() => _shyariState();
}

class _shyariState extends State<shyari> {
  List cat_name = [
    "Good Luck Shayari",
    "Dosti Shayari",
    "Funny Shayari",
    "God Shayari",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    permision();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        title: Text("Love Shayari",style: TextStyle(fontFamily: 'Bold',fontSize: 24),),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share),
            padding: EdgeInsets.only(right: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
            padding: EdgeInsets.only(right: 20),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cat_name.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 50,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return secound(index, cat_name);
                  },
                ));
                print("Click $index");
              },
              title: Text(
                cat_name[index],
                style: TextStyle(fontSize: 24, color: Colors.green,fontFamily: 'Bold'),
                // textAlign: TextAlign.left,
              ),
              // subtitle: Text(""),
              leading: Container(
                height: 100,
                width: 50,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("images/k${index + 1}.jpg"),
                //         fit: BoxFit.fill)),
              ),
              trailing: Icon(Icons.keyboard_double_arrow_right),
            ),
          );
        },
      ),
    );
  }

  Future<void> permision() async {


    var status = await Permission.storage.status;
    if (status.isDenied) {
      await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }
}
