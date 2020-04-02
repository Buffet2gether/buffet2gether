import 'package:flutter/material.dart';
import 'package:buffet2gether_home/pages/info_page.dart';

class Info
{
  String imageUrl;
  String name1;
  String name2;
  String location;
  String time;
  String promotion;
  String promotionInfo;
  Widget action;

  Info(
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

List<Info> listRec = [
  Info(
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
  Info(
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
  Info(
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
  Info(
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

List<Info> listMore = [
  Info(
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
      name2: listRec[0].name2,
      image: listRec[0].imageUrl,
      location: listRec[0].location,
      time: listRec[0].time,
      promotion: listRec[0].promotion,
      promotionInfo: listRec[0].promotionInfo,
    ),
  ),
  Info(
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
  Info(
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