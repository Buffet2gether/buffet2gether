import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/info_page.dart';

class More
{
  String imageUrl;
  String name;
  String location;
  String time;
  Widget action;

  More(
      {
        this.imageUrl,
        this.name,
        this.location,
        this.time,
        this.action,
      }
      );
}

List<More> listMore = [
  More(
    imageUrl: 'assets/images/more1.png',
    name: 'อี๊ดบุฟเฟ่ต์ชาบู',
    location: '463/2 Kaki ngam 1   ',
    time: '09.00 - 20.00',
    action: More1(),
  ),
  More(
    imageUrl: 'assets/images/more2.png',
    name: 'YAMASHITAKEA Shabu',
    location: '12/96 Kaki ngam 4   ',
    time: '11.00 - 23.00',
    action: More2(),
  ),
  More(
    imageUrl: 'assets/images/more3.png',
    name: 'Neta Grill',
    location: 'MEGA-BANGNA   ',
    time: '11.00 - 22.30',
    action: More3(),
  ),
];