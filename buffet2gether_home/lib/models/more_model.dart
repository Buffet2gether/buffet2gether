import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/info_page.dart';

class More
{
  String imageUrl;
  String name1;
  String name2;
  String location;
  String time;
  String promotion;
  String promotionInfo;
  Widget action;

  More(
      {
        this.imageUrl,
        this.name1,
        this.name2,
        this.location,
        this.time,
        this.promotion,
        this.promotionInfo,
        this.action,
      }
      );
}

List<More> listMore = [
  More(
    imageUrl: 'assets/images/more1.png',
    name1: 'อี๊ดบุฟเฟ่ต์ชาบู',
    name2: '',
    location: '463/2 Kaki ngam 1   ',
    time: '09.00 - 20.00',
    promotion: 'อร่อยไม่อั้น กับบุฟเฟต์ราคาพิเศษ เพียงท่านละ 319 บาท...',
    promotionInfo: '''
              อร่อยไม่อั้น กับบุฟเฟต์ราคาพิเศษ เพียงท่านละ 319 บาท ในโปรโมชั่น Happy Hour Buffet 319 ทานบุฟเฟต์ ราคาพิเศษเฉพาะช่วงเวลา 08:00 – 10:00 น. เท่านั้น (เฉพาะสาขาที่ร่วมรายการ)
              เงื่อนไขโปรโมชั่น
              - เฉพาะสาขาที่ร่วมรายการเท่านั้น
              - ราคาผู้ใหญ่ 319 บาทสุทธิ/ท่าน และราคาเด็ก (ส่วนสูง 131 ซม. ขึ้นไป) 319 บาทสุทธิ/ท่าน
              - ราคาเด็ก (ส่วนสูง 101 – 130 ซม.) 159 บาทสุทธิ/ท่าน (เด็กที่ส่วนสูงต่ำกว่า 100 ซม. ไม่คิดค่าใช้จ่าย)
              - ระยะเวลารับประทาน 1 ชั่วโมง 15 นาที ส่วนเกินทุก 10 นาที คิดค่าบริการ 20 บาท/ท่าน
              - ไม่สามารถใช้ร่วมกับส่วนลด หรือรายการส่งเสริมการขายอื่นๆ ได้
              - สมาชิก BevFood App และ Eed Pointo Card สามารถใช้คะแนนสะสมแลกเป็นส่วนลดเพิ่มจากโปรโมชั่นได้และยอดใช้จ่ายหลังหักส่วนลดสามารถสะสมคะแนนได้
              - บริษัทฯ ขอสงวนสิทธิ์ในการเปลี่ยนแปลงเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า
              ''',
    action: InfoPage(
      name1: listMore[0].name1,
      name2: listMore[0].name2,
      image: listMore[0].imageUrl,
      location: listMore[0].location,
      time: listMore[0].time,
      promotion: listMore[0].promotion,
      promotionInfo: listMore[0].promotionInfo,
    ),
  ),
  More(
    imageUrl: 'assets/images/more2.png',
    name1: 'YAMASHITAKEA Shabu',
    name2: '',
    location: '12/96 Kaki ngam 4   ',
    time: '11.00 - 23.00',
    promotion: 'คูปองโปรโมชั่น ชาบูชิบุฟเฟ่ต์ มา 4 คน ลด 400.-',
    promotionInfo: '''
              คูปองโปรโมชั่น YAMASHITAKEA SHABU มา 4 คน ลด 400.-
              อิ่มเต็มร้อยกับ YAMASHITAKEA SHABU Buffet อร่อยยกสายพาน…อิ่มยกก๊วนให้ครบ 4 ท่าน แล้วเซฟคูปองในมือถือมาโชว์ที่หน้าร้าน!! รับราคาพิเศษเลยทันที!!
              เฉพาะที่ร้าน “YAMASHITAKEA SHABU” โดยสแกน QR Code ที่จุดแคชเชียร์พร้อมลงทะเบียนรับสิทธิ์
              กำหนด 1 ภาพต่อการใช้สิทธิ์ 1 ครั้ง (1 ภาพต่อลูกค้า 4 ท่าน) อร่อยให้สุดกับโปรคุ้มแห่งปี
              เริ่มแล้วตั้งแต่ วันนี้ – 26 กรกฏาคม 2562 นี้ (4วันเท่านั้น) อร่อยกันแบบล้นสายพานที่YAMASHITAKEA SHABU
              ''',
    action: InfoPage(
      name1: listMore[1].name1,
      name2: listMore[1].name2,
      image: listMore[1].imageUrl,
      location: listMore[1].location,
      time: listMore[1].time,
      promotion: listMore[1].promotion,
      promotionInfo: listMore[1].promotionInfo,
    ),
  ),
  More(
    imageUrl: 'assets/images/more3.png',
    name1: 'Neta Grill',
    name2: '',
    location: 'MEGA-BANGNA   ',
    time: '11.00 - 22.30',
    promotion: 'โปรเงินสด ย่างเอง 499+ บาท',
    promotionInfo: '''
              สำหรับราคาถ้าเป็นย่างเอง 499+ บาท(ไม่รวมน้ำและเซอร์วิสชาร์จ 10%) เน็ตประมาณ 600 บาท
              ย่างให้ 599+ บาท(ไม่รวมน้ำและเซอร์วิสชาร์จ 10%) เน็ตประมาณ 700 บาท
              เด็ก 279+ บาท(ความสูงต่ำกว่า 90 เซนติเมตรทานฟรี)
              ''',
    action: InfoPage(
      name1: listMore[2].name1,
      name2: listMore[2].name2,
      image: listMore[2].imageUrl,
      location: listMore[2].location,
      time: listMore[2].time,
      promotion: listMore[2].promotion,
      promotionInfo: listMore[2].promotionInfo,
    ),
  ),
];