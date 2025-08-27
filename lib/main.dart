import 'package:flutter/material.dart';

void main() {
  runApp(const ModaApp());
}

class ModaApp extends StatelessWidget {
  const ModaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnaSayfa(title: 'Flutter Demo Home Page'),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key, required this.title});

  final String title;

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Moda Uygulaması",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt), color: Colors.grey),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 150,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                listeElemani('assets/model1.jpeg', "assets/chanellogo.jpg"),
                SizedBox(width: 30),
                listeElemani('assets/model2.jpeg', "assets/louisvuitton.jpg"),
                SizedBox(width: 30),
                listeElemani('assets/model3.jpeg', "assets/chloelogo.jpg"),
                SizedBox(width: 30),
                listeElemani('assets/model1.jpeg', "assets/chanellogo.jpg"),
                SizedBox(width: 30),
                listeElemani('assets/model2.jpeg', "assets/louisvuitton.jpg"),
                SizedBox(width: 30),
                listeElemani('assets/model3.jpeg', "assets/chloelogo.jpg"),
                SizedBox(width: 30),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listeElemani(String imagePath, String logoPath) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage(logoPath), fit: BoxFit.cover)
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(15)
          ),
          alignment: Alignment.center,
          child: Text("Follow", style: TextStyle(fontFamily: 'Montserrat', color: Colors.white)),
        )
      ],
    );
  }

}
