import 'package:flutter/material.dart';
import 'package:shayari/shayari_pages/thirdpage.dart';

class secound extends StatefulWidget {
  int index;
  List cat_name;

  secound(this.index, this.cat_name);

  @override
  State<secound> createState() => _secoundState();
}

class _secoundState extends State<secound> {
  List good_luck = [
    """Jab Dhadkano Ko Tham Leta Hai Koi,
Jab Khayalo Mein Naam Hamara Leta Hai koi,
Yaade Tab aur Yaadgar Ban Jaati Hai,
Jab Hume Humse Behtar Jaan Leta Hai Koi.""",
    """Tu iss kadar mujhe apne kareeb lagta hai,
Tujhe alag sochu to ajeeb lagta hai,
Ye dosti ye chahate ye mohabat sab kya hai,
Tu to mujzhe mera naseeb lagta hai.""",
    """Kuch rahe na rahe teri mohabbat ka sahara rahe,
Pyar main dooba, hamesha ye dil hamara rahe,
Khushian teri, saare ghum mere ho dua yahi hai,
Ankhoon mein sada chehra tumhara rahe.
"""
  ];
  List dosti = [
    """Manzilon Se Apni Dar Na Jana,
Raaste Ki Preshaniyon Se Toot Na Jana,

Jab Bhi Jarurat Ho Zindagi Mein Kisi Apne Ki
Hum Aapke Apne Hain Ye Bhool Na Jana…""",
    """Teri Dosti Ne Bahut Kuch Sikha Diya,
Meri Khamosh Duniya Ko Jaise Hansa Diya,
Karjdaar Hun Main Us Khuda Ka Jisne,
Mujhe Tere Jaise Dost Se Mila Diya…""",
    """Kitni Jaldi Yeh Mulakat Gujar Jaati Hai,
Pyas Bujhti Nahi Ke Barsaat Gujar Jaati Hai,
Aapki Yaadon Se Kah Do Ke Yun Na Aaya Karen,
Neend Aati Nahi Aur Raat Gujar Jaati Hai…"""
  ];
  List funny = [
    """Meethi Hai mithaai
papdi thoda shakt Hai
Hamari Zindagi tu Jaani
Badi Jabardast hai..!""",
    """Tu rukhi Hai Tujhe Kaise
Main Manaun Tu Kahe To Tere
Liye Aalu ki sabji mein banao.""",
    """Aajkal Ka Pyar Ham
machharon ki tarah ho
gaya hai jab tak allout chalta
hai tab tak pyar chalta hai..!""",
  ];
  List god = [
    """Banaane waale ne bhi tujhe, kisi karan se banaaya hoga,

Chhoda hoga jab jamin par tujhe,

Uske sine mein bhi dard to aaya hoga""",
    """Bhagwaan ka diya kabhi alp nahi hota,

Jo toot jaaye vo sankalp nahi hota,

Haar ko jeet se door hi rakhanaa,

Kyonki jeet ka koi vikalp nahi hota""",
    """Mere yaar bina koi mahfil na sajadi hai,

Jaise chand bina raat adhuri lagadi hai,

e-khuda sab ko esa yaar dena,

jiske aane se jindagi roshan si lagadi hai""",
    """Jindagi hasin hai jindagi se pyaar karo,

Ho raat to subah ka intjaar karo,

Vo pal bhi aayega jis pal ka intjaar hai aapko,

Bas rab par bharosa aur wakt pe etbaar karo"""
  ];
  List blank = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if (widget.index == 0) {
        blank = good_luck;
      } else if (widget.index == 1) {
        blank = dosti;
      } else if (widget.index == 2) {
        blank = funny;
      } else if (widget.index == 3) {
        blank = god;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //context == current class no object
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cat_name[widget.index]}",style: TextStyle(fontFamily: 'Bold',fontSize: 24),),
        elevation: 25,
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
        itemCount: blank.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 50,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.pinkAccent,
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return third(index, blank, good_luck, dosti, funny, god);
                  },
                ));
                // print("Click $index");
              },
              title: Text(
                blank[index],
                maxLines: 1,
                style: TextStyle(fontSize: 23,fontFamily: 'Bold'),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
          );
        },
      ),
    );
  }
}
