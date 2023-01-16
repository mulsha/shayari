import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class four extends StatefulWidget {
  int index;
  List blank;

  four(this.index, this.blank);

  @override
  State<four> createState() => _fourState();
}

class _fourState extends State<four> {
  List bgcolor = [
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.black54,
    Colors.brown,
    Colors.green,
    Colors.deepPurpleAccent,
    Colors.deepPurple,
    Colors.white,
    Colors.lightGreen,
    Colors.pink,
    Colors.purple,
    Colors.grey,
    Colors.pinkAccent,
    Colors.blue,
  ];

  List emoji = [
    "😄😄😄😄😄😄",
    "😘😘😘😘😘😘",
    "🌹🌹🌹🥀🥀🥀",
    "🎉🎉🎉🎉🎊🎊🎊🎊",
    "😘😘😘😘😘😘"
  ];

  List fontt = ["Regular", "Bold", "Mediam", "SemiBold"];

  String e = "";
  String f = "Bold";

  Color bgcolr = Colors.red;
  Color fontcolr = Colors.white;
  double textsize = 25;
  String floderpath = "";

  GlobalKey gb = GlobalKey();
  PageController pc = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _createFolder();
    pc = PageController(initialPage: widget.index);
    // _capturePng();
  }

  _createFolder() async {
    String folderName = "ShayariApp2022";
    final path = Directory("storage/emulated/0/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }

    setState(() {
      floderpath = path.path;
      print("$floderpath");
    });
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      gb.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("फोटो पे शायरी लिखें"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: RepaintBoundary(
                    key: gb,
                    child: PageView.builder(itemCount: widget.blank.length,controller: pc,onPageChanged: (value){
                      setState(() {
                        widget.index=value;
                      });
                    },
                      itemBuilder: (context, index) {
                        return Container(
                          color: bgcolr,
                          margin: EdgeInsets.only(top: 15, left: 8, right: 8),
                          // height: 390,
                          // width: 360,
                          child: Center(
                              child: Text(
                                "$e\n${widget.blank[widget.index]}\n$e",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: textsize,
                                    color: fontcolr,
                                    fontFamily: '$f'),
                              )),
                        );
                      },
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(top: 10),
                  // height: 10,
                  // color: Colors.red,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black54,
                  margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.restart_alt_rounded),
                                iconSize: 40,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.zoom_out_map),
                                iconSize: 40,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          height: 200,
                                          child: GridView.builder(
                                            itemCount: bgcolor.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    setState(() {
                                                      bgcolr = bgcolor[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    color: bgcolor[index],
                                                    margin: EdgeInsets.all(5),
                                                  ));
                                            },
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8),
                                          ));
                                    },
                                  );
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 90,
                                  margin: EdgeInsets.only(
                                      bottom: 12, top: 15, left: 10, right: 5),
                                  color: Colors.red,
                                  child: Center(
                                      child: Text(
                                        "Background",
                                        style: TextStyle(
                                            fontSize: 17, fontFamily: 'Anotreg'),
                                      )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 200,
                                          child: GridView.builder(
                                              itemCount: bgcolor.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      fontcolr = bgcolor[index];
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.all(8),
                                                    color: bgcolor[index],
                                                  ),
                                                );
                                              },
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 5)),
                                        );
                                      });
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 110,
                                  margin: EdgeInsets.only(
                                      bottom: 12, top: 15, left: 5, right: 5),
                                  color: Colors.red,
                                  child: Center(
                                    child: Text("Text Color",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Anotreg')),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _capturePng().then((value) {
                                    print("$value");

                                    String imagename =
                                        "Image${Random().nextInt(1000)}.jpg";

                                    String Imagepath = "$floderpath/$imagename";

                                    print("imagepath=====$Imagepath");

                                    File file = File(Imagepath);

                                    file.writeAsBytes(value);

                                    Share.shareFiles(['${file.path}']);

                                    // text:
                                    //     "https://play.google.com/store/apps/details?id=com.king.candycrushsaga&hl=en_IN&gl=US");
                                  });
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 100,
                                  margin: EdgeInsets.only(
                                      bottom: 12, top: 15, left: 5, right: 10),
                                  color: Colors.red,
                                  child: Center(
                                    child: Text("Share",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Anotreg')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 180,
                                        child: ListView.builder(
                                          itemCount: fontt.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                Navigator.pop(context);
                                                setState(() {
                                                  f = fontt[index];
                                                });
                                              },
                                              title: Center(
                                                  child: Text(
                                                    fontt[index],
                                                    maxLines: 1,
                                                  )),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 15, top: 10, left: 10, right: 5),
                                  color: Colors.red,
                                  child: Center(
                                    child: Text("Font",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'Anotreg')),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 200,
                                          child: ListView.builder(
                                            itemCount: emoji.length,
                                            itemBuilder: (context, index) {
                                              return ListTile(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    e = emoji[index];
                                                  });
                                                },
                                                title: Center(
                                                    child: Text(
                                                      emoji[index],
                                                      maxLines: 1,
                                                    )),
                                              );
                                            },
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 15, top: 10, left: 5, right: 5),
                                  color: Colors.red,
                                  child: Center(
                                    child: Text("Emoji",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Anotreg')),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 180,
                                        child: StatefulBuilder(
                                          builder: (context, setState1) {
                                            return Slider(
                                              min: 0,
                                              max: 100,
                                              value: textsize,
                                              divisions: 20,
                                              label:
                                              textsize.round().toString(),
                                              inactiveColor: Colors.orange,
                                              onChanged: (value) {
                                                setState1(() {
                                                  setState(() {
                                                    textsize = value;
                                                  });
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  // height: 30,
                                  // width: 130,
                                  margin: EdgeInsets.only(
                                      bottom: 15, top: 10, left: 10, right: 5),
                                  color: Colors.red,
                                  child: Center(
                                    child: Text("Text Size",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Anotreg')),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
