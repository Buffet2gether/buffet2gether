import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/info_page.dart';

class Recom
{
  String imageUrl;
  String name1;
  String name2;
  String location;
  String time;
  String promotion;
  String promotionInfo;
  Widget action;

  Recom(
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

List<Recom> listRec = [
  Recom(
    imageUrl: 'assets/images/rec1.png',
    name1: 'รสแซ่บ ! ทะเลปู',
    name2: ' บุฟเฟ่ต์ทะเลเผา',
    promotion: 'ฉลองความสุข  ส่งท้ายปี  “ มา 4 จ่าย 3 ”  ที่รสแซ่บ !  ทะเล..',
    promotionInfo: '''
              ฉลองความสุข ส่งท้ายปี “มา 4 จ่าย 3” ที่รสแซ่บ บุฟเฟต์
              เงื่อนไขโปรโมชั่น
              • สมาชิก BevFood Application กดรับ e-Coupon “มา 4 จ่าย 3” เพื่อใช้สิทธิ์โปรโมชั่นที่รสแซ่บเท่านั้น
              • กำหนด 1 คูปองต่อการใช้สิทธิ์ 1 ครั้ง (1 คูปองต่อลูกค้า 4 ท่าน)
              • ระยะเวลาโปรโมชั่น เฉพาะวันที่ 23 ธ.ค. 63 – 27 ธ.ค. 63 เท่านั้น
              • โปรโมชั่นเฉพาะร้านรสแซ่บสาขาในประเทศไทยเท่านั้น
              • ช่วง Happy Hour Buffet (ราคา 319 บาท) สาขาสามย่านมิตรทาวน์ไม่ร่วมรายการ
              • สงวนสิทธิ์เฉพาะราคาปกติสำหรับผู้ใหญ่เท่านั้น ราคาเด็กไม่ร่วมรายการ
              • ส่วนลดเฉพาะค่าอาหาร ไม่รวมเครื่องดื่มแอลกอฮอล์, สินค้าฝากขาย และโฮมเดลิเวอรี่
              • สามารถใช้ร่วมกับบัตรกำนัลเงินสด 250 บาท และ 500 บาทของโออิชิกรุ๊ปได้
              • ไม่สามารถใช้ร่วมกับส่วนลด หรือรายการส่งเสริมการขายอื่นๆ ได้
              • สมาชิก BevFood Application และ Roszab Pointo Card สามารถใช้คะแนนสะสมแลกเป็นส่วนลดเพิ่มจากโปรโมชั่นได้ และยอดใช้จ่ายหลังหักส่วนลดสามารถสะสมคะแนนได้
              • บริษัทฯ ขอสงวนสิทธิ์ในการเปลี่ยนแปลงเงื่อนไขโดยไม่ต้องแจ้งให้ทราบล่วงหน้า
              ''',
    action: InfoPage(
      name1: listRec[0].name1,
      name2: listRec[0].name2,
      image: listRec[0].imageUrl,
      location: listRec[0].location,
      time: listRec[0].time,
      promotion: listRec[0].promotion,
      promotionInfo: listRec[0].promotionInfo,
    ),
  ),
  Recom(
    imageUrl: 'assets/images/rec2.png',
    name1: 'กิ่งก้านซีฟู้ด',
    name2: ' หอย ปู ทะเล',
    promotion: 'ฉลองวันหยุดสุดสัปดาห์กันด้วย บุฟเฟ่ต์ห้องอาหารนานา..',
    promotionInfo: '''
              ฉลองวันหยุดสุดสัปดาห์กันด้วย บุฟเฟ่ต์ห้องอาหารนานาชาติ  ันเดย์บรันช์ (Sunday Brunch) กับซีฟู้ดนานาชนิด พร้อมไฮไลท์ที่รับรองว่าทุกคนต้องถูกใจอย่าง ล็อบสเตอร์เทอมิดอร์ ซุบก้ามกุ้งล็อบสเตอร์จุกๆ สั่งทำได้ตามใจไม่มีอั้น และนอกจากนี้ยังมีอาหารอื่นๆ อีกมากมายให้เลือกทาน ที่ห้องอาหาร Feast โรงแรม รอยัล ออรคิด เชอราตัน
              • ราคา : โปร🔥 ราคา 1,299 บาท ต่อคน (ราคาปกติ 2,000 บาท ต่อคน)
              • ระยะเวลาโปรโมชั่น : ทุกวันอาทิตย์ 11.30-15.00 น.
              • ที่อยู่ : โรงแรม Royal Orchid Sheraton Hotel & Towers
              • ถ.เจริญกรุง ซ.30 แขวง/เขตบางรัก กรุงเทพฯ
              • พิกัด : g.page/royalorchidsheratonhotel
              • โทร : 0-2266-0123
              • เว็บไซต์ : www.facebook.com/royalorchidsheratonhotel
              ''',
    action: InfoPage(
      name1: listRec[1].name1,
      name2: listRec[1].name2,
      image: listRec[1].imageUrl,
      location: listRec[1].location,
      time: listRec[1].time,
      promotion: listRec[1].promotion,
      promotionInfo: listRec[1].promotionInfo,
    ),
  ),
  Recom(
    imageUrl: 'assets/images/rec3.png',
    name1: 'บุฟเฟ่ต์ขนมจีน',
    name2: ' เปิดใหม่ใกล้BTS',
    promotion: 'ฉลองเปิดร้านใหม่!! พบกับโปรโมชั่นขนมจีน ลด 20% ทุก...',
    promotionInfo: '''
              ฉลองเปิดร้านใหม่!!
              พบกับโปรโมชั่นขนมจีน ลด 20% ทุกโต๊ะ ตั้งแต่วันนี้ - 30 ส.ค. 58
              แล้วท่านจะกับขนมจีนเส้นสด น้ำยาแสนอร่อย และบุพเฟ่ผักนานาชนิดที่เติมได้ไม่อั้น...
              ร้านขนมจีนเส้นสดเพชรลด 3 ร้านอยู่ตรงข้าม รพ.สมเด็จพระยุพราชหล่มเก่า ก่อนถึงปั้ม ปตท. หล่มเก่า
              โทร 084-5973594, 085-1263450
              ''',
    action: InfoPage(
      name1: listRec[2].name1,
      name2: listRec[2].name2,
      image: listRec[2].imageUrl,
      location: listRec[2].location,
      time: listRec[2].time,
      promotion: listRec[2].promotion,
      promotionInfo: listRec[2].promotionInfo,
    ),
  ),
  Recom(
    imageUrl: 'assets/images/rec3.png',
    name1: 'บุฟเฟ่ต์ขนมจีน',
    name2: ' สาขา 2',
    promotion: 'ฉลองเปิดร้านใหม่!! พบกับโปรโมชั่นขนมจีน ลด 20% ทุก...',
    promotionInfo: '''
              ฉลองเปิดร้านใหม่!!
              พบกับโปรโมชั่นขนมจีน ลด 20% ทุกโต๊ะ ตั้งแต่วันนี้ - 30 ส.ค. 58
              แล้วท่านจะกับขนมจีนเส้นสด น้ำยาแสนอร่อย และบุพเฟ่ผักนานาชนิดที่เติมได้ไม่อั้น...
              ร้านขนมจีนเส้นสดเพชรลด 3 ร้านอยู่ตรงข้าม รพ.สมเด็จพระยุพราชหล่มเก่า ก่อนถึงปั้ม ปตท. หล่มเก่า
              โทร 084-5973594, 085-1263450
              ''',
    action: InfoPage(
      name1: listRec[3].name1,
      name2: listRec[3].name2,
      image: listRec[3].imageUrl,
      location: listRec[3].location,
      time: listRec[3].time,
      promotion: listRec[3].promotion,
      promotionInfo: listRec[3].promotionInfo,
    ),
  ),
];