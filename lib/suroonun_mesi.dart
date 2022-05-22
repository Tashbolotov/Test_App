import 'package:guiz_application/suroo.modeli.dart';

class SuroonunMesi {
  int _index = 0;
  List<SurooModeli> suroolorJanaJooptar = <SurooModeli>[
    SurooModeli(suroo: 'Kyrgyzstan kytaida jaigashkan', joop: false), //0
    SurooModeli(suroo: 'Kyrgyzstan egemendu olko', joop: true), //1
    SurooModeli(suroo: 'Batken borbor shar', joop: false), //2
    SurooModeli(suroo: 'Alay Toolu aimak', joop: true), //3
  ];

  String suroonuAlipkel() {
    if (_index < suroolorJanaJooptar.length) {
      return suroolorJanaJooptar[_index].suroo;
    } else {
      return 'Buttu';
    }
  }

  bool jooptuAlypKel() {
    return suroolorJanaJooptar[_index].joop;
  }

  void SuroonuOtkoz() {
    _index++;
  }

  void kairaBashta() {
    _index = 0;
  }
}

SuroonunMesi suroonunMesi = SuroonunMesi();
