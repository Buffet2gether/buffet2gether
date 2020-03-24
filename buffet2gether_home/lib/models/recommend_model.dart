import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/info_page.dart';

class Recom
{
  String imageUrl;
  String name1;
  String name2;
  Widget action;

  Recom(
  {
    this.imageUrl,
    this.name1,
    this.name2,
    this.action,
  }
  );
}

List<Recom> listRec = [
  Recom(
    imageUrl: 'assets/images/rec1.png',
    name1: 'รสแซ่บ ! ทะเลปู',
    name2: 'บุฟเฟ่ต์ทะเลเผา',
    action: Rec1(),
  ),
  Recom(
    imageUrl: 'assets/images/rec2.png',
    name1: 'กิ่งก้านซีฟู้ด',
    name2: 'หอย ปู ทะเล',
    action: Rec2(),
  ),
  Recom(
    imageUrl: 'assets/images/rec3.png',
    name1: 'บุฟเฟ่ต์ขนมจีน',
    name2: 'เปิดใหม่ใกล้BTS',
    action: Rec3(),
  ),
  Recom(
    imageUrl: 'assets/images/rec3.png',
    name1: 'บุฟเฟ่ต์ขนมจีน',
    name2: 'สาขา 2',
    action: Rec3(),
  ),
];