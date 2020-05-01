///คลาส model รายละเอียดของหน้าเชิญเข้ากลุ่ม InviteToGroup
class InfoInGroup
{
  String number;
  String name1;
  String name2;
  String location;
  String time;
  String imageUrl;
  int ageStart;
  int ageEnd;
  double people;
  String dueTime;
  String gender;

  InfoInGroup(
      {
        this.number,
        this.name1,
        this.name2,
        this.location,
        this.time,
        this.imageUrl,
        this.ageStart,
        this.ageEnd,
        this.dueTime,
        this.gender,
        this.people,
      }
      );
}