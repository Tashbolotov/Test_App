import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:guiz_application/suroo.modeli.dart';
import 'package:guiz_application/suroonun_mesi.dart';

import 'custon_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String suroo;
  bool buttubuIndicator;

  List<Widget> ikonKalar = <Widget>[];
  Widget tuuraIconka = const Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: FaIcon(
        FontAwesomeIcons.check,
        color: Color(0xff4CAF52),
        size: 45,
      ));

  Widget kataIconka = const Padding(
    padding: EdgeInsets.only(
      left: 20,
    ),
    child: FaIcon(
      FontAwesomeIcons.xmark,
      color: Color(0xfff54335),
      size: 45,
    ),
  );
  List<Widget> ikonKala = <Widget>[];
  void koldonuuchuuJoopBerdi(bool koldonuchuununJoobu) {
    bool tuuraJooptor = suroonunMesi.jooptuAlypKel();
    if (koldonuchuununJoobu == tuuraJooptor) {
      ikonKalar.add(tuuraIconka);
    } else {
      ikonKalar.add(kataIconka);
    }
    suroonunMesi.SuroonuOtkoz();
    suroo = suroonunMesi.suroonuAlipkel();
    if (suroo == 'Buttu') {
      buttubuIndicator = true;
    }
    setState(() {});
  }

  @override
  void initState() {
    suroo = suroonunMesi.suroonuAlipkel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      // backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Тапшырма 07'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 25,
            ),
            Text(
              suroo ?? 'Suroo bosh',
              style: const TextStyle(fontSize: 35, color: Colors.white),
            ),
            if (buttubuIndicator == true)
              CustomButton(
                text: 'Kayradan Bashta',
                onPressed: () {
                  suroonunMesi.kairaBashta();
                  suroo = suroonunMesi.suroonuAlipkel();
                  buttubuIndicator = false;
                  ikonKalar = [];
                  setState(() {});
                },
              )
            else
              Column(
                children: [
                  CustomButton(
                    text: 'Туура',
                    tus: const Color(0xff4CAF52),
                    onPressed: () {
                      koldonuuchuuJoopBerdi(true);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                    text: 'Ката',
                    tus: const Color(0xfff54335),
                    onPressed: () {
                      koldonuuchuuJoopBerdi(false);
                    },
                  ),
                  Row(
                    children: ikonKalar,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// class FaIcon {
//   FaIcon(IconData xmark, {Color color, int size});
// }

