import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/shayari_pages/forthpage.dart';

class third extends StatefulWidget {
  int index;
  List blank;
  List good_luck;
  List dosti;
  List funny;
  List god;

  third(
      this.index, this.blank, this.good_luck, this.dosti, this.funny, this.god);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  String floderpath = "";
  GlobalKey gb = GlobalKey();
  PageController next = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    next = PageController(initialPage: widget.index);
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
        title: Text(
          "${widget.blank[widget.index]}",
          maxLines: 1,
          style: TextStyle(fontFamily: 'Bold', fontSize: 24),
        ),
        elevation: 25,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.red,
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
                flex: 5,
                child: PageView.builder(
                  itemCount: widget.blank.length,
                  controller: next,
                  onPageChanged: (value){
                    setState(() {
                      widget.index=value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.pinkAccent,
                      margin: EdgeInsets.only(top: 1, left: 8, right: 8),

                      child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 35, bottom: 35),
                            child: Text(
                              "${widget.blank[widget.index]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontFamily: 'Bold'),
                            ),
                          )),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(top: 0),
                  // height: 10,
                  // color: Colors.red,
                ),
              ),
              Expanded(
                // flex: ,
                child: Container(
                  color: Colors.green,
                  margin: EdgeInsets.only(top: 0, bottom: 5, left: 8, right: 8),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                FlutterClipboard.copy(
                                    '${widget.blank[widget.index]}')
                                    .then((value) {
                                  Fluttertoast.showToast(
                                      msg: "Copied",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Colors.black12,
                                      textColor: Colors.black,
                                      fontSize: 16.0);
                                });
                                print("copy");
                              },
                              child: Icon(
                                Icons.file_copy_rounded,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget.index > 0) {
                                    widget.index--;
                                    next.jumpToPage(widget.index);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "No More",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.black12,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                  print(widget.index);
                                });
                              },
                              child: Icon(
                                Icons.chevron_left,
                                size: 45,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return four(widget.index, widget.blank);
                                  },
                                ));
                                print("edit");
                              },
                              child: Icon(
                                Icons.edit_note_rounded,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (widget.index < widget.blank.length - 1) {
                                    widget.index++;
                                    next.jumpToPage(widget.index);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "No More",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 2,
                                        backgroundColor: Colors.black12,
                                        textColor: Colors.black,
                                        fontSize: 16.0);
                                  }
                                  print(widget.index);
                                });
                              },
                              child: Icon(
                                Icons.chevron_right,
                                size: 45,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _capturePng().then((value) {

                                  print("value===$value");

                                  String imagename="Image${Random().nextInt(1000)}.jpg";

                                  String imagepath="$floderpath/$imagename";

                                  print("imahepath===$imagepath");

                                  File file=File(imagepath);

                                  Share.shareFiles(['${file.path}']);

                                });
                              },
                              child: Icon(
                                Icons.share,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
